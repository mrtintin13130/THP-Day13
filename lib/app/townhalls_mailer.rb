require 'mail'
require 'csv'
require 'net/smtp'

array_allinf = CSV.read('../../db/test.csv')
x = 0
#class mailer
  options = {  :address => "smtp.gmail.com", # Options STMP
  	       :port => 587,
	       :user_name => 'thpdays13@gmail.com',
	       :password => 'zsxedcrfv123',
	       :authentication => 'plain',
	       :enable_starttls_auto => true }
  Mail.defaults do # Passing methods to STMP
    delivery_method :smtp, options
  end

  def send_email(address, array_allinf, x) # Send email
	html_body = File.read('../../db/thp.html')
    Mail.deliver do
      to address
      from 'thpdays13@gmail.com'
      subject 'Formation TheHackingProject'
      content_type 'text/html; charset=UTF-8'
      body html_body.sub("[NOM_COMMUNE]", array_allinf[x][0])
    end
  end
  while array_allinf[x]
	  send_email(array_allinf[x][1], array_allinf, x)
	  puts array_allinf[x][1]
	  x += 1
  end
#end
