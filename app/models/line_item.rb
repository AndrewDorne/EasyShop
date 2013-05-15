class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  attr_accessible :cart_id, :item_id

  def total_price
    item.price * quantity
  end
end
