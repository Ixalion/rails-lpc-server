class CreateSpriteTilesheetPolymorphics < ActiveRecord::Migration[5.1]
  def change
    create_table :sprite_tilesheet_polymorphics do |t|
      t.references :sprite_tilesheet, foreign_key: true
      t.references :tilesheetable, polymorphic: true, index: {
        unique: true,
        name: :sprite_tilesheet_polymorphics_uniqueness_index
      }

      t.timestamps
    end
  end
end
