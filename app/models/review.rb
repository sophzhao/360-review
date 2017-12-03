class Review < ApplicationRecord
    has_many :sentences
    belongs_to :business_owner



    def self.dates
        reviews = Review.all
        dates = []
        reviews.each do |date|
            unless dates.include?(date.date.year)
                dates.push(date.date.year)
            end
        
    end
    return dates
    end


    def self.numReviews
        reviews = Review.all
        count = 0
        reviews.each do |review|
            count = count + 1
        end
        return count
    end
    
end
