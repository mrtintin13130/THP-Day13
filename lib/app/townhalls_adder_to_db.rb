require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

x = 0
array_allinf = CSV.read('../../db/townhalls.csv')
array_userid = []
while array_allinf[x]
  @twitter = client.user_search("Mairie " + array_allinf[x][0])
  array_userid[x] = @twitter.first
  puts x
  puts array_userid[x]
  x += 1
end
y = 0

data = CSV.read("../../db/townhalls.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
hashed_data = data.map { |d| d.to_hash }

x = 0
y = 0
hash = []
hashed_data.each do
  hash[x] = hashed_data[x].merge({:handle => array_userid[y]})
  x += 1
  y += 1
end

class Array
  def to_csv(csv_filename="test.csv")
    require 'csv'
    CSV.open(csv_filename, "wb") do |csv|
      csv << first.keys # adds the attributes name on the first line
      self.each do |hash|
        csv << hash.values
      end
    end
  end
end

hash.to_csv("../../db/townhalls.csv")

