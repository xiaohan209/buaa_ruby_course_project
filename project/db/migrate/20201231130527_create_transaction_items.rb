class CreateTransactionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_items do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price,:precision => 10,:scale => 2
      t.references :transaction_order, foreign_key: true

      t.timestamps
    end
  end
end
