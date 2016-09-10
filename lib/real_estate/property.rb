module RealEstate
  class Property
    attr_reader :id, :location, :type, :tenure, :href
    def initialize(hash = {})
      @id = hash[:id]
      @location = hash[:location]
      @type = hash[:type]
      @tenure = hash[:tenure]
      @href = hash[:href]
    end

    def to_json
      {
        id: @id,
        type: @type,
        location: @location,
        tenure: @tenure,
        href: href
      }
    end

    def detail
      # send request to get property details
    end

    def self.get_property_from_html(html)
      id = location = type = tenure = href = ""
      doc = Nokogiri::HTML(html)
      doc.at_css('li.listing-item').each do |attr_name, attr_value|
        if attr_name == "class"
          # <li class="listing-item featured-listing  listing-id-12547831 ">
          attr_value.split(" ").each do |x|
            id = x.delete("listing-id-") if x.start_with?("listing-id-")
          end
        end
      end

      location  = doc.at_css('div.listing-info p.listing-location span').text
      type      = doc.at_css('div.listing-info span.lst-ptype').text
      tenure    = doc.at_css('div.listing-info span.lst-tenure').text[/\d+/]
      href      = doc.at_css('div.listing-img a')['href']

      Property.new(id: id, location: location, type: type, tenure: tenure, href: href)
    end
  end
end