class CreateFlashCards < ActiveRecord::Migration[8.0]
  def change
    create_table :flash_cards do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.boolean :published, null: false, default: false

      t.integer :collectable_maps_count, null: false, default: 0

      t.text :answer, null: false
      t.text :prompt, null: false

      t.bigint :favorites_count, null: false, default: 0

      t.timestamps
    end
  end
end
