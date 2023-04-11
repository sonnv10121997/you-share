json.extract! shared_movie, :id, :url, :user_id, :created_at, :updated_at
json.url shared_movie_url(shared_movie, format: :json)
