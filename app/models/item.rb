class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price, :category

  belongs_to :category

  searchable do
    text :name
    text :category
  end
end
