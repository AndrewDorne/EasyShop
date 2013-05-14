class AddCategoriesItems < ActiveRecord::Migration
  def up
    create_table :categories_items, :id=>false do |t|
      t.integer :category_id
      t.integer :item_id
    end
    remove_column :items, :category
  end

  def down
    drop_table :categories_items
    add_column :items, :category 
  end
end
