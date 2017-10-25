json.extract! analysis_result, :id, :sentence_id, :sentiment_label, :sentiment_score, :created_at, :updated_at
json.url analysis_result_url(analysis_result, format: :json)
