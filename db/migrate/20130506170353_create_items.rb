class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :brand

      t.timestamps
    end
  end
end
