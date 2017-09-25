class CreateSpriteCharacterBodyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_character_body_types do |t|
      t.integer :sex, null: false
      t.integer :body
      t.integer :eyes
      t.integer :ears
      t.integer :nose
      t.integer :facial_type
      t.integer :facial_color

      t.timestamps
    end

    add_index(
      :sprite_character_body_types,
      [
        :sex,
        :body,
        :eyes,
        :ears,
        :nose,
        :facial_type,
        :facial_color
      ],
      unique: true,
      name: :sprite_character_body_types_uniqueness_index
    ) # add_index
  end
end
