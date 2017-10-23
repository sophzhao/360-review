class BusinessOwner < ApplicationRecord
    has_many: reviews
    has_many: sentences, through: :reviews
end
