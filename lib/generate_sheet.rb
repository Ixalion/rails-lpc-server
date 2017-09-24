require "oily_png"

require "generate/helper"
require "generate/body_filelist"

def merge_files(files)
  combined_image = ChunkyPNG::Image.from_file(files.first)

  files[1..-1].each do |file|
    img = ChunkyPNG::Image.from_file(file)

    combined_image.combine(img)
  end

  return combined_image
end

def generate_full_filelist(options={})
  array = Array.new

  array.concat(generate_body_filelist(options[:body]))
end
