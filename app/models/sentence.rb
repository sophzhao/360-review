class Sentence < ApplicationRecord
    belongs_to :review
    has_many :business_owners, through: :review

    scope :rankpos, -> { order(sentiment_score: :desc) }
    scope :rankneg, -> { order(sentiment_score: :asc) }
    scope :positive, -> { where(sentiment_label: 'positive') }
    scope :negative, -> { where(sentiment_label: 'negative') }
    scope :rankdate, -> { joins(:review).order('date DESC') }


    def self.overallScore 
    	score = 0
    	count = 0
    	reviews = Sentence.all
    	reviews.each do |sentiment|
    		score = score + sentiment.sentiment_score
    		count = count + 1
    	end
    	percentage = score/count
    	if score >= 0
    		percentage = ((percentage + 1)/2)*100 
    		percentage = (percentage *100).round/100
    		result = percentage.to_s + '%'
    		return result
    	else
    		percentage = ((percentage.abs + 1)/2)*100
    		percentage =(percentage *100).round/100 
    		result = percentage.to_s + '%'
    		return result
    	end
    end

    



    def self.numSentences 
        count = 0
        reviews = Sentence.all
        reviews.each do |sentiment|
            count = count + 1
        end
        return count
    end

    def self.numPositive 
        count = 0
        reviews = Sentence.positive.all
        reviews.each do |sentiment|
            count = count + 1
        end
        return count
    end

    def self.numNegative 
        count = 0
        reviews = Sentence.negative.all
        reviews.each do |sentiment|
            count = count + 1
        end
        return count
    end

end