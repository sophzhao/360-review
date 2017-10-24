class Review < ApplicationRecord
    has_many :sentences
    belongs_to :business_owner
end
