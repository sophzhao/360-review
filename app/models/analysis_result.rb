class AnalysisResult < ApplicationRecord


  scope :positive,       -> { where(sentiment_label: 'positive') }
  scope :negative,     	 -> { where(sentiment_label: 'negative') }
  
end
