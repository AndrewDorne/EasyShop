class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :title, :item_id, :user_id
  # array of likes 

  belongs_to :user
  belongs_to :item
  has_many :comments
end
