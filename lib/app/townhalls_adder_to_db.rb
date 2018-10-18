require 'twitter'
require 'dotenv'
require 'csv'
Dotenv.load
townshalls = CSV.read('../../db/townhalls.csv')



class Add_to_db

  def db_to_a
    get_names = Array.new
    x=0
    while x >= 0
    CSV.foreach('../../db/townhalls.csv') do |row|
      get_names << row[0]
      get_names.reduce{|x| "@" + x }
      x+=1
    puts get_names.each

    end
  end
  def machine_to_db
    CSV.open("../../db/townhalls.csv", "ab") f |csv|
      csv << [get_names]

    end

  end

end
var = Add_to_db
var
