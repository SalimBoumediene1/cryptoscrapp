require 'nokogiri'
require 'open-uri'

class StartScrap

    def initialize
        doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        tabname = []
        tabvalue = []
        doc.css('a.currency-name-container.link-secondary').each do |element| tabname << element.text end
        doc.css('a.price').each do |element| tabvalue << element.text end
        myhash = Hash[tabname.zip(tabvalue)]
        return myhash
    end

    def save        
        initialize.each do |key, v|
            bitcoin = Bitcoin.new
            bitcoin.name = key.downcase
            bitcoin.value = v
            bitcoin.save
        end
    end

    def perform
        save
    end
    
    
end