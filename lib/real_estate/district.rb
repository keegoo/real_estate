require 'nokogiri'

module RealEstate
  class District

    attr_reader :code, :freetext

    def initialize(code, freetext)
      raise ArgumentError, "code or freetext cannot be nil" if code == nil || freetext == nil
      @code, @freetext = code, freetext
    end
  end
end