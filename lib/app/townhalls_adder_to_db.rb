require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

x = 400
array_allinf = CSV.read('../../db/townhalls.csv')
array_userid = []
while array_allinf[x]
	@twitter = client.user_search("Mairie " + array_allinf[x][0])
	array_userid[x] = @twitter.first
	puts x
	puts array_userid[x]
	x += 1
end

y = 0
CSV.open('../../db/townhalls.csv', 'a+').each do |csv|
	if array_userid[y]
		csv << array_userid[y]
		puts array_userid[y]
		y += 1
	else
		puts "ça existe pas"
	end
end
