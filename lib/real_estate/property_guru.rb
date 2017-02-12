require 'nokogiri'
require 'cgi'


module RealEstate
  class PropertyGuru

    def initialize
      @html = HTMLBuilder.new
    end

    # ------------------
    # districts = 
    # [{
    #   "market" => "residential",
    #   "freetext" => "D28 Seletar / Yio Chu Kang",
    #   "district_code[]" => "D28"
    # }, ...]
    def districts
      x = []
      doc = Nokogiri::HTML(@html.districts)
      doc.css("div.param-district_code label").each do |node|
        code = node.css('input')[0]['value']
        freetext = node.text
        x.push(District.new(code, freetext))
      end
      x
    end

    # ------------------
    # when you search a district, you'll get a page 
    # of properties. And hundreds pages.
    def total_page(district)
      Nokogiri::HTML(@html.total_page)
      doc.at_css('h1.search-title span').text.delete(",").to_i
    end

    # ------------------
    # get properties in specific page of district
    def properties(district, page_num)
      x
      doc = Nokogiri::HTML(@html.page(district, page_num))
      doc.css('div.listing-list li.listing-item').each do |property_node|
        ppt = Property.get_property_from_html(property_node.text)
        x.push(ppt)
      end
      x
    end
  end
end

