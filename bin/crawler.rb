require '../lib/real_estate.rb'

a = RealEstate::PropertyGuru.new

a.districts.each do |dct|
  puts "#{dct.code} => #{dct.freetext}"

 district = {
   "market"          => "residential",
   "freetext"        => dct.freetext,
   "district_code[]" => dct.code
 }
  n = a.total_page(district)
  puts "total page: #{n}"
  (1..n).each{|i|
    properties = a.properties(district, i)

    properties.each{|x|
      x.details
      puts "#{x.name}:#{x.id}"
    }
  }
end

