class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.belongs_to :user, foreign_key: true

      t.boolean :published, null: false, default: false
      t.boolean :timed, null: false, default: false

      t.integer :collectable_maps_count, null: false, default: 0
      t.integer :questions_count, null: false, default: 0
      t.integer :timer

      t.bigint :favorites_count, null: false, default: 0

      t.string :title, null: false

      t.text :description, null: false

      t.timestamps
    end
  end
end
