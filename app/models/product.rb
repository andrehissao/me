class Product < ActiveRecord::Base
  attr_accessible :code, :description, :name, :price
end
