class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price, :category, :image, :image1, :image2

  searchable do
    text :name
    text :category
  end
end
