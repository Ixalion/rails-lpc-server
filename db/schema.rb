# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170925220311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sprite_character_body_types", force: :cascade do |t|
    t.integer "sex", null: false
    t.integer "body", null: false
    t.integer "eyes", null: false
    t.integer "ears", null: false
    t.integer "nose", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sex", "body", "eyes", "ears", "nose"], name: "sprite_character_body_types_uniqueness_index", unique: true
  end

  create_table "sprite_character_hair_color_palettes", force: :cascade do |t|
    t.string "name"
    t.integer "very_light", null: false
    t.integer "light", null: false
    t.integer "medium_light", null: false
    t.integer "medium_dark", null: false
    t.integer "medium_dark_transparent", null: false
    t.integer "dark", null: false
    t.integer "very_dark", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sprite_character_hair_color_palettes_on_name", unique: true
    t.index ["very_light", "light", "medium_light", "medium_dark", "medium_dark_transparent", "dark", "very_dark"], name: "sprite_character_hair_color_palettes_uniqueness_index", unique: true
  end

  create_table "sprite_tilesheet_polymorphics", force: :cascade do |t|
    t.bigint "sprite_tilesheet_id"
    t.string "tilesheetable_type"
    t.bigint "tilesheetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprite_tilesheet_id"], name: "index_sprite_tilesheet_polymorphics_on_sprite_tilesheet_id"
    t.index ["tilesheetable_type", "tilesheetable_id"], name: "sprite_tilesheet_polymorphics_uniqueness_index", unique: true
  end

  create_table "sprite_tilesheets", force: :cascade do |t|
    t.integer "tile_width", null: false
    t.integer "tile_height", null: false
    t.string "file", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sprite_tilesheet_polymorphics", "sprite_tilesheets"
end
