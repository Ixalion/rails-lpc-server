class Sprite::Tilesheet < ApplicationRecord
  has_many  :tilesheet_polymorphics,
            dependent: :destroy

  has_many  :tilesheetables,
            through: :tilesheet_polymorphics
end
