class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price

  searchable do
    text :name
  end
end
