require 'csv'
data = CSV.read("townhalls.csv", 
		{ encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
hashed_data = data.map { |d| d.to_hash }

print hashed_data
x = 0
hash = []
while x < 380 
	 hash[x] = hashed_data[x].merge({:handle => "@mabite"})
    x += 1
end
puts hash
