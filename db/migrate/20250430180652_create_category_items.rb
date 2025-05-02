class CreateCategoryItems < ActiveRecord::Migration[8.0]
  def change
    create_table :category_items do |t|
      t.belongs_to :category, null: false, foreign_key: true

      t.text :description, null: false

      t.timestamps
    end
  end
end
