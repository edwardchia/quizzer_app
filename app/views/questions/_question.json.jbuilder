json.extract! question, :id, :description, :solution_id, :test_id, :created_at, :updated_at
json.url question_url(question, format: :json)
