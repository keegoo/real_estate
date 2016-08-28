module RealEstate
  class PropertyGuru
    ROOT = 'http://www.propertyguru.com.sg'
    def self.district
      districts = []
      page = Nokogiri::HTML(HTTParty.get(ROOT + "/"))
      page.css("div.param-district_code label").each do |node|
        districts.push(node.text)
      end

      districts
    end
  end
end