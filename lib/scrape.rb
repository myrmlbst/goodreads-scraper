require 'net/http'
require 'nokogiri'

# http client
url = 'https://www.goodreads.com/genres/classics'
response = Net::HTTP.get_response(URI(url))

if response.code != '200'
    puts "Error: #{response.code}"
    exit
end

# html parser
doc = Nokogiri::HTML(response.body)
doc.css('#leftContainer').each do |node|
    print(node.content)
end
