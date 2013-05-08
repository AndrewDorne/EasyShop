class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price, :category, :image1, :image2, :image3

  searchable do
    text :name
    text :category
  end
end
