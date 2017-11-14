class CreateSimilarSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :similar_sentences do |t|
      t.integer :sentence_id_1
      t.integer :sentence_id_2
      
    end
  end
end
