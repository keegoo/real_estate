require_relative "real_estate/version.rb"

require_relative "real_estate/property_guru.rb"
require_relative "real_estate/district.rb"
require_relative "real_estate/html_builder.rb"
require_relative "real_estate/property.rb"

# ########## code sample ##########
# a = RealEstate.PropertyGuru.new
#
# a.districts.each{|x|
#   pages = x.pages
#   x.properties({page: 1}) # [xx, yy]
# }
#
# properties.each{|x| x.to_json}
# #################################
module RealEstate
  # Your code goes here...
  FIDDLER_PROXY_ENABLED = false
end
