class CreateSpriteTilesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_tilesheets do |t|
      t.integer :tile_width, null: false
      t.integer :tile_height, null: false
      t.string :file, null: false

      t.timestamps
    end
  end
end
