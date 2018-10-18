require 'twitter'
require 'dotenv'
require 'townhalls.csv' # rajouter nom fichier
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

def initialize(new_csv = '')
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end
def scrap
  @new_csv = if new_csv == ''
                   "../db/townhalls.CSV"# rajouter chemin
              else
              new_csv
              end
@mairie = Scrapper.new.read(@new_csv) #methode de scrapping a rajouter


def add_handle
  @mairie.each do |commune|# iteration sur le nom de chaque commune
  mairie = client.user_search(commune["name"])# recherche par noms de commune sur twitter
  puts mairie

  end
  

end