class CreateSpriteCharacterHairColorPalettes < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_character_hair_color_palettes do |t|
      t.string :name
      t.integer :very_light, null: false
      t.integer :light, null: false
      t.integer :medium_light, null: false
      t.integer :medium_dark, null: false
      t.integer :medium_dark_transparent, null: false
      t.integer :dark, null: false
      t.integer :very_dark, null: false

      t.timestamps
    end
    add_index :sprite_character_hair_color_palettes, :name, unique: true

    add_index(
      :sprite_character_hair_color_palettes,
      [
        :very_light,
        :light,
        :medium_light,
        :medium_dark,
        :medium_dark_transparent,
        :dark,
        :very_dark
      ],
      unique: true,
      name: :sprite_character_hair_color_palettes_uniqueness_index
    ) # add_index
  end
end
