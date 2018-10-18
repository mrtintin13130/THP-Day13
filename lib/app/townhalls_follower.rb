require 'twitter'
require 'dotenv'
require 'fichier scrapper' # rajouter nom fichier
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
def scrap
  @new_json = if new_json == ''
                   "/../.JSON"
              else
              new_json
              end
@mairie = Scrapper.new.read(@new_json) #methode de scrapping a rajouter


def follow
  @mairie.each do |commune|# iteration sur le nom de chaque commune
  mairie = client.user_search(commune["name"])# recherche par noms de commune sur twitter
  begin 
  client.follow!(mairie[0])# follow a partir d'un handle
  commune["mairie"] = "@" + mairie[0].screen_name #ajout @ devant le nom de commune

  end
  

end