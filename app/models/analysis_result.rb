class AnalysisResult < ApplicationRecord

 belongs_to :sentence

  scope :positive,       -> { where(sentiment_label: 'positive') }
  scope :negative,     	 -> { where(sentiment_label: 'negative') }
  
end
