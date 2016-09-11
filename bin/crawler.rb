require '../lib/real_estate.rb'

a = RealEstate::PropertyGuru.new

a.districts.each do |dct|
  puts "#{dct.code} => #{dct.freetext}"
end