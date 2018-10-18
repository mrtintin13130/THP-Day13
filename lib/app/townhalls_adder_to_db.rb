require 'twitter'
require 'dotenv'
require 'townhalls_scrapper.rb' # rajouter nom fichier
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

def initialize(csv_filename="test.csv")
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end
def scrap
  require'csv'
  @mairie =CSV.read(csv_filename, "wb") do |csv|

@ville = get_all_names.new.read(@mairie) #methode de scrapping a rajouter
  #methode de scrapping a rajouter


def add_handle
  @ville.each do |commune|# iteration sur le nom de chaque commune
  mairie = client.user_search(commune["name"])# recherche par noms de commune sur twitter
  puts mairie

  end
  

end