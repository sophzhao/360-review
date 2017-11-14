class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.string :review_id
      t.string :sentence_content
      t.string :sentiment_label
      t.float :sentiment_score

      t.timestamps
    end
  end
end
