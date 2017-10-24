class Review < ApplicationRecord
    has_many :sentences
    belongs_to :business_owner

    def self.get_random_review
        # 'sample' randomly grabs a value (a review)
        self.all.sample
    end


    # Validations

    # Scopes


end
