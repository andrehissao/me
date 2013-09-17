require 'nokogiri'
require 'open-uri'

module ProductsHelper
  
    def getProduct(url)
    @product = Product.new
    doc = Nokogiri::HTML(open(URI(url)))

    #Name
    doc.css('.productName').each do |v|
      @product.name = v.content
    end
    
    #Code
    doc.css('.productReference').each do |v|
      @product.code = v.content
    end
    
    #Price
    doc.css('.skuBestPrice').each do |v|
      @product.price = v.content.delete(' ').delete('R$').delete('.').gsub(',','.')
    end
    
    #Description
    doc.css('.productDescription').each do |v|
      @product.description = v.content
    end
    
    #Image
    doc.css('#botaoZoom').each do |v|
      rel = v.attributes['rel'].value.gsub(/\r/,'').gsub(/\n/,'')
      host = URI(url).host
      @product.image_remote_url = "http://#{host}#{rel}"
    end

  end
end
