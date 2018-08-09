require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize(website = 'https://coinmarketcap.com/all/views/all/')
    @website = website
  end

  def trader_obscure
    doc = Nokogiri::HTML(open(@website))

    names = doc.css('a.currency-name-container.link-secondary').map{ |name| name.text } #Les noms
    prices = doc.css('a.price').map{ |price| price.text } #Les prix

    res=[]
    names.length.times do |i|
      res += [{ 'name' => names[i], 'price' => prices[i] }]
      i += 1
    end
    return res
  end

  def perform

  end

  def save

  end

end
