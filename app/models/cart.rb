class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :items
  belongs_to :user
end