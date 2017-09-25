require "generate/body_filelist"
require "generate/helper"

require "tempfile"

Sprite::Character::BodyType::sexes.keys.each do |sex|
  Sprite::Character::BodyType::bodies.keys.each do |body|
    Sprite::Character::BodyType::noses.keys.each do |nose|
      Sprite::Character::BodyType::eyes.keys.each do |eyes|
        Sprite::Character::BodyType::ears.keys.each do |ears|
          body_type = Sprite::Character::BodyType.find_or_create_by(
            sex: sex,
            body: body,
            nose: nose,
            eyes: eyes,
            ears: ears
          )


          if body_type.tilesheet.nil?
            file_list = SpritesheetGenerator.body_filelist_from_body_type(body_type)
            tfile = Tempfile.new(['spritesheet', '.png'])

            image = SpritesheetGenerator.merge_files(file_list)
            image.save(tfile.path)

            tilesheet = Sprite::Tilesheet.new(
              tile_width: 32,
              tile_height: 32
            )
            tilesheet.file = tfile.open

            tilesheet.save

            body_type.tilesheet = tilesheet

            body_type.save
          end
        end
      end
    end
  end
end
