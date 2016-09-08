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

      properties = []
      doc = HTMLBuilder.page(district, num)
      doc.css('div.listing-list li.listing-item').each do |property_node|
        hash = self.get_property_from_html_node(property_node)
        properties.push(Property.new(hash))
      end
      properties
    end

    def self.get_property_from_html_node(property_node)
      id = location = type = tenure = href = ""

      property_node.at_css('li.listing-item').each do |attr_name, attr_value|
        if attr_name == "class"
          # <li class="listing-item featured-listing  listing-id-12547831 ">
          attr_value.split(" ").each do |x|
            id = x.delete("listing-id-") if x.start_with?("listing-id-")
          end
        end
      end

      location = property_node.at_css('div.listing-info p.listing-location span').text
      type = property_node.at_css('div.listing-info span.lst-ptype').text
      tenure = property_node.at_css('div.listing-info span.lst-tenure').text[/\d+/]
      href = property_node.at_css('div.listing-img a')['href']
      {
        id: id,
        location: location,
        type: type,
        tenure: tenure,
        href: href
      }
    end
  end
end