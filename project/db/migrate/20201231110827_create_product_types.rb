class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types do |t|
      t.string :product_type_name

      t.timestamps
    end
  end
end
