class Item < ActiveRecord::Base
  has_many :line_items
  has_many :reviews 
  has_and_belongs_to_many :categories

  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :brand, :brandimage, :description, :name, :price, :image, :image1, :image2

  searchable do
    string :name
    string :brand
    double :price
    integer :category_ids, :multiple => true, :references => Category
  end

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Currently in a cart, cannot delete')
      return false
    end
  end

  def average_review
    sum = reviews.to_a.sum { |review| review.rating }
    sum/(1.0*total_reviews)
  end

  def total_reviews
    reviews.count
  end
end
