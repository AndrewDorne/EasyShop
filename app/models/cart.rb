class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :line_items, :dependent => :destroy
  # Not sure if needed
  belongs_to :user

  def add_item(item_id)
    current_item = line_items.find_by_item_id(item_id)
    if current_item
      puts "here"
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
      current_item.price = current_item.item.price
      puts "else"
      puts current_item
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.to_a.sum { |item| item.quantity }
  end
end
