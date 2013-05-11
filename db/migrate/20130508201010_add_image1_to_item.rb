class AddImage1ToItem < ActiveRecord::Migration
  def change
    add_column :items, :image1, :string
  end
end
