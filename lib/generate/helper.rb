module SpritesheetGenerator
  SPRITESHEET_DIR = File.join(Rails.root, "spritesheet")

  def self.merge_files(files)
    combined_image = ChunkyPNG::Image.from_file(files.first)

    files[1..-1].each do |file|
      img = ChunkyPNG::Image.from_file(file)

      combined_image.compose(img)
    end

    return combined_image
  end

end
