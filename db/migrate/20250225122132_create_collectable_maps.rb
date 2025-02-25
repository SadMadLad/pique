class CreateCollectableMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :collectable_maps do |t|
      t.belongs_to :collectable, polymorphic: true, null: false
      t.belongs_to :collection, null: false, foreign_key: true

      t.index %i[collection_id collectable_id collectable_type], unique: true

      t.timestamps
    end
  end
end
