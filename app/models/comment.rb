class Comment < ActiveRecord::Base
  attr_accessible :description

  belongs_to :review
  belongs_to :user
end
