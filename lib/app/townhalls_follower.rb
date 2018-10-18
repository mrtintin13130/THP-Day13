require 'twitter'
require 'dotenv'
 # rajouter nom fichier
require 'csv'
Dotenv.load

  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

array_allinf = CSV.read('../../db/townhalls.csv')
x = 0

while array_allinf[x]
    @twitter = client.user_search("Mairie " + array_allinf[x][0])
    puts "je follow bien"
    client.follow(@twitter.first)
end
