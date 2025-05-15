# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_01_145641) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "categorization_quiz_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorization_quiz_id"], name: "index_categories_on_categorization_quiz_id"
  end

  create_table "categorization_quizzes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favorites_count", default: 0, null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categorization_quizzes_on_user_id"
  end

  create_table "category_items", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_items_on_category_id"
  end

  create_table "collectable_maps", force: :cascade do |t|
    t.string "collectable_type", null: false
    t.bigint "collectable_id", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collectable_type", "collectable_id"], name: "index_collectable_maps_on_collectable"
    t.index ["collection_id", "collectable_id", "collectable_type"], name: "idx_on_collection_id_collectable_id_collectable_typ_702ff00160", unique: true
    t.index ["collection_id"], name: "index_collectable_maps_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "public", default: true, null: false
    t.integer "collectable_maps_count", default: 0, null: false
    t.integer "items_count", default: 0, null: false
    t.bigint "favorites_count", default: 0, null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["user_id", "favoritable_id", "favoritable_type"], name: "idx_on_user_id_favoritable_id_favoritable_type_2b2b890add", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "flash_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "published", default: false, null: false
    t.integer "collectable_maps_count", default: 0, null: false
    t.text "answer", null: false
    t.text "prompt", null: false
    t.bigint "favorites_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flash_cards_on_user_id"
  end

  create_table "ordering_items", force: :cascade do |t|
    t.bigint "ordering_quiz_id", null: false
    t.bigint "correct_order", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ordering_quiz_id"], name: "index_ordering_items_on_ordering_quiz_id"
  end

  create_table "ordering_quizzes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favorites_count", default: 0, null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ordering_quizzes_on_user_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.boolean "correct", default: false, null: false
    t.text "option_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.boolean "multiple_answers", default: false, null: false
    t.integer "score", default: 1, null: false
    t.text "question_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "published", default: false, null: false
    t.boolean "timed", default: false, null: false
    t.integer "collectable_maps_count", default: 0, null: false
    t.integer "questions_count", default: 0, null: false
    t.integer "timer"
    t.bigint "favorites_count", default: 0, null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tag_maps", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id", "taggable_id", "taggable_type"], name: "index_tag_maps_on_tag_id_and_taggable_id_and_taggable_type", unique: true
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_tag_maps_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "tag_type", default: 0, null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.bigint "favorited_items_count", default: 0, null: false
    t.string "role", default: "user", null: false
    t.string "email_address", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "categorization_quizzes"
  add_foreign_key "categorization_quizzes", "users"
  add_foreign_key "category_items", "categories"
  add_foreign_key "collectable_maps", "collections"
  add_foreign_key "collections", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "flash_cards", "users"
  add_foreign_key "ordering_items", "ordering_quizzes"
  add_foreign_key "ordering_quizzes", "users"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "tag_maps", "tags"
end
