class Sprite::Character::BodyType < ApplicationRecord

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
  ]

  enum body: [
    :dark,
    :dark2,
    :darkelf,
    :darkelf2,
    :light,
    :orc,
    :red_orc,
    :tanned,
    :tanned2
  ]

  enum nose: [
    :bignose,
    :buttonnose,
    :straightnose
  ]

  enum eyes: [
    :blue,
    :brown,
    :gray,
    :green,
    :orange,
    :purple,
    :red,
    :yellow
  ]

  enum ears: [
    :bigears,
    :elvenears
  ]

  enum facial_type: [
    :beard,
    :bigstache,
    :fiveoclock,
    :frenchstache,
    :mustache
  ]
end
