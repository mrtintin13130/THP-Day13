require 'twitter'
require 'dotenv'
 load 'townhalls_adder_to_db.rb'
 require 'csv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs



  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

@mairie = add_handle.new
client.follow(@mairie)
