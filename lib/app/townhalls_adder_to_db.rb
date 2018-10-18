# frozen_string_literal: true

require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

# quelques lignes qui enregistrent les cles d'APIs

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_API_TOKEN']
  config.access_token_secret = ENV['TWITTER_API_TOKEN_SECRET']
end

x = 0
array_allinf = CSV.read('./../../db/townhalls.csv')
names = []
array_userid = []

while array_allinf[x]
  names[x] = 'Mairie ' + array_allinf[x][0]
  x += 1
end

x = 0
names.each do |name|
  twitter = client.user_search(name)
  if twitter_user = twitter.first
    array_userid[x] = twitter_user.screen_name
  end
  puts x
  x += 1
end

data = CSV.read('./../../db/townhalls.csv', { encoding: 'UTF-8', headers: true, header_converters: :symbol, converters: :all })
hashed_data = data.map { |d| d.to_hash }

x = 0
y = 0
hash = []
while hashed_data[y]
  y += 1
end
z = 1
while x < y
  hash[x] = hashed_data[x].merge({ handle: array_userid[z] })
  x += 1
  z += 1
end

class Array
  def to_csv(csv_filename="test.csv")
    CSV.open(csv_filename, "wb") do |csv|
      csv << first.keys # adds the attributes name on the first line
      self.each do |hash|
        csv << hash.values
      end
    end
  end
end

hash.to_csv("../../db/townhalls.csv")
