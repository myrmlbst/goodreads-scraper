require 'net/http'
require 'nokogiri'

# http client
url = 'https://www.w3schools.com'
response = Net::HTTP.get_response(URI(url))

if response.code != '200'
    puts "Error: #{response.code}"
    exit
end

# html parser
doc = Nokogiri::HTML(response.body)
doc.css('#subtopnav a').each do |node|
    print(node.content + "\n")
end
