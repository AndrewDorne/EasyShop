class AddImage3ToItem < ActiveRecord::Migration
  def change
    add_column :items, :image3, :string
  end
end
