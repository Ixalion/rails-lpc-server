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
  ], _prefix: true

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
  ], _prefix: true

  enum nose: [
    :default,
    :bignose,
    :buttonnose,
    :straightnose
  ], _prefix: true

  enum eyes: [
    :default,
    :blue,
    :brown,
    :gray,
    :green,
    :orange,
    :purple,
    :red,
    :yellow
  ], _prefix: true

  enum ears: [
    :default,
    :bigears,
    :elvenears
  ], _prefix: true
end
