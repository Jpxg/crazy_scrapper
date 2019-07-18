require 'nokogiri'
require 'open-uri'
require 'pry'

def get_deputy_info(deputy_url)
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{deputy_url}"))
  names = page.css('div.titre-bandeau-bleu h1').text.split(' ')[1..-1]
  hash = {}
  hash['first_name'] = names[0]
  hash['last_name'] = names[1..-1].join(' ')
  begin
    path = '//a[@class="email"]'
    hash['email'] = page.xpath(path).first['href'].gsub('mailto:','')
  rescue NoMethodError => e
    puts "no email for #{names.join(' ')}."
    hash['email'] = ""
  end
  hash
end

def get_deputy_url
  page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  array = []
  links = page.xpath('//a[starts-with(@href,"/deputes/fiche/")]')
  links.each do |url|
    array << url['href']
  end

  array
end

def perform
  deputies_infos_hash = []
  deputy_urls = get_deputy_url
  deputy_urls.each_with_index do |url, i|
    puts "#{i + 1} /#{deputy_urls.length} Work in progress..."
    deputies_infos_hash << get_deputy_info(url)
  end
  deputies_infos_hash
end

puts perform