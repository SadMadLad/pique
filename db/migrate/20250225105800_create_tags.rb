class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.integer :tag_type, null: false, default: 0

      t.string :tag, null: false

      t.index :tag, unique: true

      t.timestamps
    end
  end
end
