class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.string :review_id
      t.string :sentence_content

      t.timestamps
    end
  end
end
