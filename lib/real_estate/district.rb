require 'nokogiri'

module RealEstate
  class District
    def initialize(code, freetext)
      @code, @freetext = code, freetext

      @pages = get_pages_count()
    end

    def get_pages_count()
      str = HTMLBuilder.pages_count({
        "market" => "residential",
        "freetext" => freetext,
        "district_code[]" => code
        })

      doc = Nokogiri::HTML(str)
      doc.at_css('h1.search-title span').text.delete(",").to_i
    end

    def properties_at_page(num)
      district = {
        "market" => "residential",
        "freetext" => freetext,
        "district_code[]" => code
      }

      doc = HTMLBuilder.page(district, num)
      doc.css('div.listing-list li.listing-item').each do |property_node|
        #properties.push(self.get_property_info(property_node))
      end
    end
  end
end