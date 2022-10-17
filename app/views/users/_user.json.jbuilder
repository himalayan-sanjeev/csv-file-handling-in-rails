json.extract! user, :id, :first_name, :last_name, :address_city, :address_state, :mobile_number, :email, :date_of_birth, :created_at, :updated_at
json.url user_url(user, format: :json)
