class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :business_owner_id
      t.string :source
      t.string :content
      t.string :username
      t.date :date
      t.integer :rating

      t.timestamps
    end
  end
end
