class CreateOrderingQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :ordering_quizzes do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.string :title, null: false

      t.text :description, null: false

      t.timestamps
    end
  end
end
