json.extract! news, :id, :team_id, :body, :created_at, :updated_at
json.url news_url(news, format: :json)
