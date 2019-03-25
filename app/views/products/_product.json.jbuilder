json.extract! product, :id, :name, :description, :style, :brand, :url, :type, :shipping_price, :note, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
