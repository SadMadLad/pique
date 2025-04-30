class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.belongs_to :categorization_quiz, null: false, foreign_key: true

      t.string :title

      t.timestamps
    end
  end
end
