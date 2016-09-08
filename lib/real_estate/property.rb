module RealEstate
  class Property
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
  end
end