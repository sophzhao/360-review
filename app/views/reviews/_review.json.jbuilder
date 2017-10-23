json.extract! review, :id, :source, :content, :username, :date, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
