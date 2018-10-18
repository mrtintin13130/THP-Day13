require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

def get_names
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  x = 0
  names = Array.new
  all_names = page.css(".lientxt").each do |n|
    names[x] = n.text
    x += 1
  end
  return names
end

def all_links

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  x = 0
  lien = Array.new
  url = page.css(".lientxt").each do |link|
    lien[x] = "http://annuaire-des-mairies.com" + link['href'][1..-1]
    x += 1
  end
  return lien
end

def get_all_the_mails_of_val_doise_townhalls(links)
  x = 0
  my_mails = Array.new
  while links[x]
    pages = Nokogiri::HTML(open(links[x]))
    mails = pages.css("tr")
    my_mails[x] = mails.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    #puts my_mails[x]
    x+=1
  end
  return my_mails
end

def create_hash(name, mail)
  x = 0
  hash_mails = []
  while name[x]
    hash_mails[x] = { 
      :Nom => name[x], 
      :Mail => mail[x]
    }
    x += 1
  end
  x = 0
=begin
  while name[x]
    puts hash_mails[x]["Nom"]
    puts "#{hash_mails[x]["Mail"]} \n\n"
    x += 1
  end
  sleep(1)
=end
  puts hash_mails
  return hash_mails
end

links = all_links
hash_mails = create_hash(get_names, get_all_the_mails_of_val_doise_townhalls(links))


class Array
  def to_csv(csv_filename="test.csv")
    require 'csv'
    CSV.open(csv_filename, "wb") do |csv|
      csv << first.keys # adds the attributes name on the first line
      self.each do |hash|
        csv << hash.values
      end
    end
  end
end


hash_mails.to_csv
