# frozen_string_literal: true

require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_API_TOKEN']
  config.access_token_secret = ENV['TWITTER_API_TOKEN_SECRET']
end

array_allinf = CSV.read('../../db/townhalls.csv')
x = 0
y = 1
while array_allinf[x]
  if array_allinf[x][2] && x > 0
    client.follow(array_allinf[x][2])
    puts "Je follow #{array_allinf[x][2]}"
    x += 1
  else
    x += 1
  end
  y += 1
end
