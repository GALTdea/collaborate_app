json.extract! daily_post, :id, :title, :completed, :user_id, :created_at, :updated_at
json.url daily_post_url(daily_post, format: :json)
