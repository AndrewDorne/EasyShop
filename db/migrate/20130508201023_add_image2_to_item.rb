class AddImage2ToItem < ActiveRecord::Migration
  def change
    add_column :items, :image2, :string
  end
end
