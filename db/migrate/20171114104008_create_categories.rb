class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sentence_categories do |t|
      t.string :category_name

    end
  end
end
