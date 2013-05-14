class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :items
  belongs_to :user

  def add_item(item_id, qty)
    item = items.where('product_id = ?', product_id).first
    if item
      item.quantity + 1
      save
    else
      item = Item.find(item_id)
      items << item
    end
    save
  end

  def total_price
    items.to_a.sum(&:full_price)
  end
end
