class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.integer :review_id
      t.string :sentence_content
      t.string :sentiment_label
      t.float :sentiment_score
      t.boolean :saved, default: false
    end
  end
end
