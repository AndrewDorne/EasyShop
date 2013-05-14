class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
  attr_accessible :brand, :brandimage, :description, :name, :price, :image, :image1, :image2

  searchable do
    text :name
    text :brand
    integer :category_ids, :multiple => true
  end
end
