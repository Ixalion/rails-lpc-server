class CreateSpriteCharacterHairFacials < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_character_hair_facials do |t|
      t.integer :sex, null: false
      t.integer :model, null: false
      t.references :sprite_character_hair_color_palette, foreign_key: true

      t.timestamps
    end
    add_index :sprite_character_hair_facials, :model

    add_index(
      :sprite_character_hair_facials,
      [
        :sex,
        :model,
        :sprite_character_hair_color_palette_id
      ],
      unique: true,
      name: :sprite_character_hair_facials_uniqueness_index
    ) # add_index
  end
end
