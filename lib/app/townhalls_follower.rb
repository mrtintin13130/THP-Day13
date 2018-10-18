require 'twitter'
require 'dotenv'
require 'fichier scrapper' # rajouter nom fichier
require 'csv'
Dotenv.load
townshalls = CSV.read('../../db/townshalls.csv')
# quelques lignes qui enregistrent les clés d'APIs
class Following

def initialize(new_json = '')
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end


      get_names.each do |follow|
      Twitter.search("Mairie #{follow}")
    end

      end




    end

end
