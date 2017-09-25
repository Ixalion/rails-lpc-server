class Sprite::TilesheetPolymorphic < ApplicationRecord
  belongs_to :sprite_tilesheet
  belongs_to :tilesheetable, polymorphic: true
end
