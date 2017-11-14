class CreateSentenceCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sentence_categories do |t|
      t.integer :category_id
      t.integer :sentence_id
      
    end
  end
end
