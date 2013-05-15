class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
  attr_accessible :brand, :brandimage, :description, :name, :price, :image, :image1, :image2

  searchable do
    string :name
    string :brand
    double :price
    integer :category_ids, :multiple => true, :references => Category
  end
end
