class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :shine
      t.integer :price
      t.integer :rarity
      t.string :color
      t.integer :faces
      t.text :images
      t.text :review

      t.timestamps null: false
    end
  end
end
