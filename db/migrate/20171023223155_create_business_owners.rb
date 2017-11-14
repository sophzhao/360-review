class CreateBusinessOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :business_owners do |t|
      t.string :user_name
      t.string :password
      t.string :business_name
      t.string :email

    end
  end
end
