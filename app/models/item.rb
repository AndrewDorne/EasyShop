class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :price

<<<<<<< HEAD
  has_and_belongs_to_many :categories
=======
  searchable do
    text :name
  end
>>>>>>> c7f69c07cfac567859ffc1f0c420e6149e1ea0c9
end
