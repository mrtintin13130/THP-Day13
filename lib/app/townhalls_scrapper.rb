require 'nokogiri'
require 'open-uri'
require 'csv'

def get_all_the_urls_of_2B
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/haute-corse.html"))
  @array_2B = []
  x = 0
  page.css("a.lientxt").each do |n|
	@array_2B[x] = "http://annuaire-des-mairies.com" + n["href"][1..-1]
    x += 1
  end
end

def get_all_the_urls_of_13
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/bouches-du-rhone.html"))
  @array_13 = []
  x = 0
  page.css("a.lientxt").each do |n|
	@array_13[x] = "http://annuaire-des-mairies.com" + n["href"][1..-1]
    x += 1
  end
end

def get_all_the_urls_of_90
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/territoire-de-belfort.html"))
  @array_90 = []
  x = 0
  page.css("a.lientxt").each do |n|
	@array_90[x] = "http://annuaire-des-mairies.com" + n["href"][1..-1]
    x += 1
  end
end

def get_all_email()
y = 0
@array_email = []
465.times do |m|
page_email = Nokogiri::HTML(open(@cities_url[m]))
	page_email.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |j|
		@array_email[y] = j.content
		y += 1
	end
end
end

def get_all_names()
y = 0
@array_name = []
465.times do |m|
page_email = Nokogiri::HTML(open(@cities_url[m]))
	page_email.xpath('/html/body/div/main/section[1]/div/div/div/h1').each do |j|
		@array_name[y] = j.content
		y += 1
	end
end
end

get_all_the_urls_of_2B
get_all_the_urls_of_13
get_all_the_urls_of_90
@cities_url = (@array_2B << @array_13 << @array_90).flatten
get_all_email
get_all_names
cities_hash = @array_name.zip(@array_email)
CSV.open("../../db/townhalls.csv", "wb") {|csv| cities_hash.to_a.each {|elem| csv << elem} }
