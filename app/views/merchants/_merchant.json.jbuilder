json.extract! merchant, :id, :name, :email, :store_name, :description, :logo, :has_storefront, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
