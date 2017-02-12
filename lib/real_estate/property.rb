module RealEstate
  class Property
    attr_reader :id, :location, :type, :tenure, :href,
                :status, :size, :currency, :unit_price, :unit, 
                :top, :developer, :total_price, :furnish, 
                :floor_level, :re_listed_at,
                :name

    attr_reader :features

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

    def details
      html = HTMLBuilder.property(@id)
      property_basics(html)
      property_features(html)
    end

    def self.get_property_from_html(htmlstr)
      id = location = type = tenure = href = ""
      doc = Nokogiri::HTML(htmlstr)
      doc.at_css('div.listing-img').each do |attr_name, attr_value|
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

    private

    def property_basics(html)
      doc = Nokogiri::HTML(html)
      doc.css('div.section-content table').each do |table|
        table.css('tr').each do |tr|
          content = tr.at_css('td').text.strip
          title = tr.at_css('th').text.strip
          case title
          when 'Type'
            @status = content.include?("Sale") ? "For Sale" : "not For Sale"
          when 'Size'
            # "506 sqft".to_i will remove trailing non-digit character
            @size = content.to_i
          when 'PSF'
            x = content.split(" ")
            @currency = x[0]
            @unit_price = x[1].delete(",").to_f
            @unit = x[2]
          when 'TOP'
            @top = content
          when 'Listing ID'
            raise RuntimeError, "Property ID cannot match!!! Wierd." unless content == @id
          when 'Tenure'
            @tenure = content.to_i
          when 'Developer'
            @developer = content
          when 'Valuation price'
            x = content.split(" ")
            @total_price = x[1].delete(",").to_f
          when 'Furnishing'
            @furnish = content
          when 'Floor Level'
            @floor_level = content
          when 'Re-listed on'
            @re_listed_at = content
          else
            raise RuntimeError, "property detail title: #{title} cannot be identified"
          end
        end
      end
      @name = doc.at_css('div.listing-details-text p.listing-title').text.strip
    end

    def property_features(html_feature)
      @features = []

      doc = Nokogiri::HTML(html_feature)
      doc.css('div#facilities div.section-content').each do |node|
        title = node.at_css('h4').text.strip

        node.css('li').each do |li|
          @features.push(li.text.strip)
        end
      end
    end

  end # end of class
end # end of module