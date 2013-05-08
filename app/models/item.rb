class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price

  has_and_belongs_to_many :categories
  searchable do
    text :name
  end
end
