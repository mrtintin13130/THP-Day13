require 'twitter'
require 'dotenv'

Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
class Following
def initialize(new_json = '')
client = Twitter::REST::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end
def check
@new_json = if new_json == ''
                   "/../.JSON"
                 else
                   new_json
                 end
@mairie = Scrapper.new.read(@new_json)


def follow
  @mairie.each do |commune|
  mairie = client.user_search(commune["name"])
  begin
  client.follow!(mairie[0])
  commune["mairie"] = "@" + mairie[0].screen_name

  client.follow(@mairie)
  end
  
end