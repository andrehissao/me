class Product < ActiveRecord::Base
  attr_accessible :image_remote_url, :code, :description, :name, :price, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates :name, :code, :presence => true
  
  def image_remote_url=(url_value)
    self.image = URI.parse(url_value)
    @image_remote_url = url_value
  end
end
