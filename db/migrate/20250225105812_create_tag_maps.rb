class CreateTagMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :tag_maps do |t|
      t.belongs_to :tag, null: false, foreign_key: true
      t.references :taggable, polymorphic: true, null: false

      t.index %i[tag_id taggable_id taggable_type], unique: true

      t.timestamps
    end
  end
end
