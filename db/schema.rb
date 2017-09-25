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

ActiveRecord::Schema.define(version: 20170925001310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sprite_character_body_types", force: :cascade do |t|
    t.integer "sex", null: false
    t.integer "body"
    t.integer "eyes"
    t.integer "ears"
    t.integer "nose"
    t.integer "facial_type"
    t.integer "facial_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sex", "body", "eyes", "ears", "nose", "facial_type", "facial_color"], name: "sprite_character_body_types_uniqueness_index", unique: true
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
    t.integer "tile_width"
    t.integer "tile_height"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sprite_tilesheet_polymorphics", "sprite_tilesheets"
end
