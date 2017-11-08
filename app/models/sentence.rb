class Sentence < ApplicationRecord
    belongs_to :review
    has_many :business_owners, through: :review
end
