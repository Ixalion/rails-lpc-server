class Sprite::Character::Hair::Head < ApplicationRecord
  belongs_to :sprite_character_hair_color_palette

  has_one   :tilesheet_polymorphics,
            as: :tilesheetable,
            class_name: "Sprite::TilesheetPolymorphic",
            dependent: :destroy

  has_one   :tilesheet,
            through: :tilesheet_polymorphics,
            class_name: "Sprite::Tilesheet",
            source: :sprite_tilesheet

  enum sex: [
    :male,
    :female
  ], _prefix: true

  enum model: [
    :bangs,
    :bangslong,
    :bangslong2,
    :bangsshort,
    :bedhead,
    :bunches,
    :jewfro,
    :long,
    :longhawk,
    :longknot,
    :loose,
    :messy1,
    :messy2,
    :mohawk,
    :page,
    :page2,
    :parted,
    :pixie,
    :plain,
    :ponytail,
    :ponytail2,
    :princess,
    :shorthawk,
    :shortknot,
    :shoulderl,
    :shoulderr,
    :swoop,
    :unkempt,
    :xlong,
    :xlongknot
  ], _prefix: true
end
