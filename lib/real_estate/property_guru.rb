require 'cgi'

# ################################
# a = RealEstate.PropertyGuru.new
#
# a.districts # [xx, yy]
#
# a.districts.each{|x|
#   pages = x.pages
#   x.properties({page: 1}) # [xx, yy]
# }
#
# properties.each{|x| x.to_json}
# ################################

module RealEstate
  class PropertyGuru
    ROOT = 'http://www.propertyguru.com.sg'
    PROPERTY_LIST = '/singapore-property-listing/property-for-sale'

    def self.district
      districts = []
      page = Nokogiri::HTML(HTTParty.get(ROOT + "/"))
      page.css("div.param-district_code label").each do |node|
        code = node.css('input')[0]['value']
        text = node.text
        districts.push({code: code, text: text})
      end

      districts
    end

    def self.properties(district)
      properties = []
      query = {
        "market" => "residential", 
        "freetext" => district[:text], 
        "district_code[]" => district[:code]
      }
      query_str = query.map{|k, v| "#{CGI::escape(k)}=#{CGI::escape(v)}" }.join("&")
      page = Nokogiri::HTML(HTTParty.get(ROOT + PROPERTY_LIST + "?" + query_str))
      page.css('div.listing-list li.listing-item').each do |property_node|
        properties.push(self.get_property_info(property_node))
      end

      properties
    end

    def self.total_properties_num(page_node)
      page_node.at_css('h1.search-title span').text.delete(",").to_i
    end

    def self.get_property_info(property_node)
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

#/singapore-property-listing/property-for-sale?market=residential&freetext=D01+Boat+Quay+%2F+Raffles+Place+%2F+Marina&district_code%5B%5D=D01
#/singapore-property-listing/property-for-sale/2?freetext=D01+Boat+Quay+%2F+Raffles+Place+%2F+Marina&district_code%5B0%5D=D01
  end
end

