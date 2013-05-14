class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
  attr_accessible :brand, :description, :name, :price, :image, :image1, :image2

  searchable do
    text :name
    integer :category_ids, :multiple => true
  end
end
