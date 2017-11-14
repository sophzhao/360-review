class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :business_owner_id
      t.string :source
      t.string :content
      t.string :username
      t.date :date
      t.integer :rating

    end
  end
end
