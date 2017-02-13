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
      doc = Nokogiri::HTML(@html.total_page(district))
      doc.at_css('h1.search-title span').text.delete(",").to_i
    end

    # ------------------
    # get properties in specific page of district
    def property_ids(district, page_num)
      doc = Nokogiri::HTML(@html.page(district, page_num))

      doc.css('li.listing-item').
        map{|x|x["class"]}.               # ["listing-item  listing-id-20461748 ", "listing-item featured-agent-listing listing-id-18743687 ", ...]
        map{|x|x.strip.split(" ")[-1]}.   # ["listing-id-20461748", "listing-id-18743687"]
        map{|x|x.split("-")[-1]}          # ["20461748", "18743687"]
    end
  end
end

