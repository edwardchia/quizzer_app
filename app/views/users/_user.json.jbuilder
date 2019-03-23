json.extract! user, :id, :email, :password, :first_name, :last_name, :is_admin, :is_teacher, :created_at, :updated_at
json.url user_url(user, format: :json)
