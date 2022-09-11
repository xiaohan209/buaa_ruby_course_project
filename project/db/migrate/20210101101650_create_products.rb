class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.references :design, foreign_key: true
      t.references :color, foreign_key: true
      t.references :size, foreign_key: true
      t.decimal :retail_price,:scale => 2,precision: 10
      t.integer :favorites
      t.integer :sales
      t.string :description
      t.string :image_directory
      t.integer :gender
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
