require 'httparty'
require 'cgi'

module RealEstate
  class HTMLBuilder
    ROOT = 'http://www.propertyguru.com.sg'
    def self.districts
      HTMLBuilder.get(ROOT + "/")
    end

    # parameter exmpale:
    # ------------------
    # district = {
    #   "market" => "residential",
    #   "freetext" => "D28 Seletar / Yio Chu Kang",
    #   "district_code[]" => "D28"
    # }
    def self.pages_count(district)
      query = query_str(district)

      HTMLBuilder.get(ROOT + "/singapore-property-listing/property-for-sale?" + query)
    end

    # parameter example:
    # ------------------
    # district is like above example
    # 
    # page = 1
    def self.page(district, page)
      query = query_str(district)

      HTMLBuilder.get(ROOT + "/singapore-property-listing/property-for-sale/#{page}?" + query)
    end

    def self.property(id)
      HTMLBuilder.get(ROOT + "/listing/" + "#{id}")
    end

    private

    def self.query_str(hash)
      hash.map{|k, v| "#{CGI::escape(k)}=#{CGI::escape(v)}"}.join("&")
    end

    def self.get(url)
      if RealEstate::FIDDLER_PROXY_ENABLED
        options = {
          http_proxyaddr: '127.0.0.1',
          http_proxyport: 8888
        }
        HTTParty.get(url, options)
      else
        HTTParty.get(url)
      end
    end
  end
end