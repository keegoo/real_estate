require 'cgi'

module RealEstate
  class PropertyGuru
    def districts
      x = []
      page = Nokogiri::HTML(HTMLBuilder.districts)
      page.css("div.param-district_code label").each do |node|
        code = node.css('input')[0]['value']
        freetext = node.text
        x.push(District.new(code, freetext))
      end
      x
    end
  end
end

