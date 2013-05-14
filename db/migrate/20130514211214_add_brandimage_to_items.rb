class AddBrandimageToItems < ActiveRecord::Migration
  def change
    add_column :items, :brandimage, :string
  end
end
