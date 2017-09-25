class CreateSpriteTilesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_tilesheets do |t|
      t.integer :tile_width
      t.integer :tile_height
      t.string :file

      t.timestamps
    end
  end
end
