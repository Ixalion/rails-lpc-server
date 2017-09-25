class CreateSpriteCharacterBodyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_character_body_types do |t|
      t.integer :sex, null: false
      t.integer :body, null: false
      t.integer :eyes, null: false
      t.integer :ears, null: false
      t.integer :nose, null: false

      t.timestamps
    end

    add_index(
      :sprite_character_body_types,
      [
        :sex,
        :body,
        :eyes,
        :ears,
        :nose
      ],
      unique: true,
      name: :sprite_character_body_types_uniqueness_index
    ) # add_index
  end
end
