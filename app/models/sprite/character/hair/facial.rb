class Sprite::Character::Hair::Facial < ApplicationRecord
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
    :beard,
    :bigstache,
    :fiveoclock,
    :frenchstache,
    :mustache
  ], _prefix: true
end
