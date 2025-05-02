class CreateOrderingItems < ActiveRecord::Migration[8.0]
  def change
    create_table :ordering_items do |t|
      t.belongs_to :ordering_quiz, null: false, foreign_key: true

      t.bigint :correct_order, null: false

      t.text :description, null: false

      t.timestamps
    end
  end
end
