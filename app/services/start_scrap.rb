require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize(website = 'https://coinmarketcap.com/all/views/all/')
    @website = website
    @cryptos = []
  end

  def trader_obscure
    doc = Nokogiri::HTML(open(@website))

    names = doc.css('a.currency-name-container.link-secondary').map{ |name| name.text } #Les noms
    prices = doc.css('a.price').map{ |price| price.text } #Les prix

    names.length.times do |i|
      @cryptos += [{ 'name' => names[i], 'price' => prices[i] }]
      i += 1
    end
  end

  def perform(name)
    trader_obscure
    @cryptos.each do |c|
      if c.values[0].downcase == name.downcase
        return [c.values[0],c.values[1]]
      end
    end
    return []
  end

  def save
    trader_obscure
    @cryptos.each do |c|
      Crypto.create(name: c.values[0], price: c.values[1])
    end
  end

end
