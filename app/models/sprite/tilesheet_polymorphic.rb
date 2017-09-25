class Sprite::TilesheetPolymorphic < ApplicationRecord
  belongs_to  :sprite_tilesheet,
              class_name: "Sprite::Tilesheet"

  belongs_to  :tilesheetable, polymorphic: true
end
