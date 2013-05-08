class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :title
  # array of likes 

  belongs_to :user
  belongs_to :item
  has_many :comments
end
