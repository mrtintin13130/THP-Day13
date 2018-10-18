require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end


  @new_csv = if new_csv == ''
                   "../db/townhalls.CSV"# rajouter chemin
              else
              new_csv
              end
@mairie = CSV.read(@new_csv) #methode de scrapping a rajouter



  @mairie.each do |commune|# iteration sur le nom de chaque commune
  mairie = client.user_search(commune["name"])# recherche par noms de commune sur twitter
  puts mairie
