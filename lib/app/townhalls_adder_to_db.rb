require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
new_csv =
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

@new_csv= "../../db/townhalls.csv"
  
              
@mairie = CSV.read(@new_csv) #methode de scrapping a rajouter



  @mairie.each do |commune|# iteration sur le nom de chaque commune
  mairie = client.user_search(commune[0])# recherche par noms de commune sur twitter

      begin
        client.follow!(mairie[0])
        commune['mairie'] = "@" + mairie[0].screen_name
      rescue StandardError
puts "Error: can't find a twitter account for #{commune['mairie']}"
end
end
