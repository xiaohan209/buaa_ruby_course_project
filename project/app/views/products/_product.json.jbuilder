json.extract! product, :id, :product_name, :design_id, :color_id, :size_id, :retail_price, :favorites, :sales, :description, :image_directory, :gender, :product_type_id, :created_at, :updated_at
json.url product_url(product, format: :json)
