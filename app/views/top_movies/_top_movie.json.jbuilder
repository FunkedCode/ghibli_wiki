json.extract! top_movie, :id, :created_at, :updated_at
json.url top_movie_url(top_movie, format: :json)
