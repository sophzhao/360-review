class CreateAnalysisResults < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_results do |t|
      t.integer :sentence_id
      t.string :sentiment_label
      t.float :sentiment_score

    end
  end
end
