class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price, :category

  searchable do
    text :name
    text :category
  end
end
