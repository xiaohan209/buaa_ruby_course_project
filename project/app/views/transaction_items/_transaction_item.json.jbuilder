json.extract! transaction_item, :id, :user_id, :product_id, :quantity, :price, :transaction_order_id, :created_at, :updated_at
json.url transaction_item_url(transaction_item, format: :json)
