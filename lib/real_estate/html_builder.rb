require 'httparty'
require 'cgi'

module RealEstate
  class HTMLBuilder
    ROOT = 'http://www.propertyguru.com.sg'

    HEADERS = {
      "Connection" => "keep-alive",
      "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36",
      "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      "Accept-Encoding" => "gzip, deflate, sdch",
      "Accept-Language" => "en-US,en;q=0.8,fr;q=0.6,zh-CN;q=0.4,zh;q=0.2,zh-TW;q=0.2"
    }

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
      query = HTMLBuilder.query_str(district)
      HTMLBuilder.get(ROOT + "/singapore-property-listing/property-for-sale?" + query)
    end

    # parameter example:
    # ------------------
    # district is like above example
    # 
    # page = 1
    def self.page(district, page)
      raise "variable: district, must be a hash" unless district.kind_of?(Hash)
      query = HTMLBuilder.query_str(district)
      HTMLBuilder.get(ROOT + "/singapore-property-listing/property-for-sale/#{page}?" + query)
    end

    def self.property(id)
      HTMLBuilder.get(ROOT + "/listing/" + "#{id}")
    end

    private

    def self.query_str(ahash)
      ahash.map{|k, v| "#{CGI::escape(k)}=#{CGI::escape(v)}"}.join("&")
    end

    def self.get(url)
      sleep(Random.new.rand(3..5))

      if RealEstate::FIDDLER_PROXY_ENABLED
        options = {
          http_proxyaddr: "127.0.0.1",
          http_proxyport: "8888",
          headers: HEADERS
        }
        HTTParty.get(url, options)
      else
        HTTParty.get(url)
      end
    end
  end
end