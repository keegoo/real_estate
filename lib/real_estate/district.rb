require 'nokogiri'

module RealEstate
  class District

    attr_reader :code, :freetext

    def initialize(code, freetext)
      raise ArgumentError, "code or freetext cannot be nil" if code == nil || freetext == nil
      @code, @freetext = code, freetext
    end

    def pages
      get_pages_count()
    end

    def properties_at_page(num)
      district = {
        "market" => "residential",
        "freetext" => freetext,
        "district_code[]" => code
      }

      properties = []
      str = HTMLBuilder.page(district, num)
      doc = Nokogiri::HTML(str)
      doc.css('div.listing-list li.listing-item').each do |property_node|
        ppt = Property.get_property_from_html(property_node.text)
        properties.push(ppt)
      end
      properties
    end

    private

    def get_pages_count()
      str = HTMLBuilder.pages_count({
        "market" => "residential",
        "freetext" => freetext,
        "district_code[]" => code
        })

      begin
        doc = Nokogiri::HTML(str)
        doc.at_css('h1.search-title span').text.delete(",").to_i
      rescue
        raise RuntimeError, "cannot get num of pages"
      end
    end
  end
end