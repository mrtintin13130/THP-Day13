require 'twitter'
require 'dotenv'
 # rajouter nom fichier
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs



  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end


client.update '1er tweet thp make it easy'
