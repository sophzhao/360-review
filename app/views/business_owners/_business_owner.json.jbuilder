json.extract! business_owner, :id, :user_name, :password, :business_name, :email, :created_at, :updated_at
json.url business_owner_url(business_owner, format: :json)
