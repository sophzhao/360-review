class Sentence < ApplicationRecord
    belongs_to: review
    belongs_to: business_owner, through: :review
end
