require "generate/body_filelist"
require "generate/helper"

require "tempfile"

Sprite::Character::BodyType::sexes.each do |sex|
  Sprite::Character::BodyType::bodies.each do |body|
    Sprite::Character::BodyType::noses.each do |nose|
      Sprite::Character::BodyType::eyes.each do |eyes|
        Sprite::Character::BodyType::ears.each do |ears|
          body_type = Sprite::Character::BodyType.first_or_create(
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
              width: 32,
              height: 32
            )
            tilesheet.avatar = tfile.open

            tilesheet.save

            body_type.tilesheet = tilesheet

            body_type.save
          end
        end
      end
    end
  end
end
