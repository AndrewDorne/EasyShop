class RemoveImageFromItem < ActiveRecord::Migration
  def up
    remove_column :items, :image3
  end

  def down
    add_column :items, :image3, :string
  end
end
