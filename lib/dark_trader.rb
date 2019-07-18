require 'pry'
require 'nokogiri'
require 'open-uri'

URL_CRYPTO = "https://coinmarketcap.com/all/views/all/"

# Collects cryptocurrencies and their prices, and puts live process
# Returns an array of hashes
def crypto_scrapping
    doc  = Nokogiri::HTML(open(URL_CRYPTO))
    rows = doc.css("#currencies-all > tbody > tr")
    rows.map do |row|
         collected_to_hash = {
         row.at_css(".col-symbol").text =>
         row.at_css(".price")['data-usd'].to_f
         }
         puts collected_to_hash
         collected_to_hash
    end
end

crypto_scrapping