require 'nokogiri'
require 'open-uri'


def get_city
    city_array = []
    Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")).css("a.lientxt").each do |city|
        city_array << city.text
    end
    return city_array
end

def get_town_urls(city_array)
    city_town_urls = city_array.map do |ville|
        "http://annuaire-des-mairies.com/95/#{ville.downcase.gsub(" ", "-")}.html"
    end
    return city_town_urls
end

def get_town_email(town_url)
    town_email_array = []
    town_url.each do |url|
        town_email_array << Nokogiri::HTML(open(url)).css("td")[7].text
    end
    return town_email_array
end

def town_email_hash (town_email_array, city_array)
    final_array = []
    for n in (0..city_array.size-1) do
        final_array << {city_array[n] => town_email_array[n]}
    end
    puts final_array
    return final_array
end

def perform
    town_email_hash (get_town_email (get_town_urls (get_city))), get_city
end

perform
