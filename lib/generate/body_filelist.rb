require_relative "helper"

# Structure:
# options = {
#   sex: Symbol, # {:male | :female}
#   body: Symbol, # e.g. :light
#   eyes: Symbol, # e.g. :green
#   ears: Symbol, # e.g. :bigears
#   nose: Symbol, # e.g. :bignose
#   facial_type: Symbol, # e.g. :beard
#   facial_color: Symbol # e.g. :brown
# }
def generate_body_filelist(options={})
  array = Array.new

  unless [:male, :female].include? options[:sex]
    raise "generate_body_filelist sex of '#{options[:sex]}' is invalid"
  end

  body_file = File.join(SPRITESHEET_DIR,
    "body",
    "#{options[:sex]}",
    "#{options[:body]}.png")

  eyes_file = File.join(SPRITESHEET_DIR,
    "body",
    "#{options[:sex]}",
    "eyes",
    "#{options[:eyes]}.png")

  ears_file = File.join(SPRITESHEET_DIR,
    "body",
    "#{options[:sex]}",
    "ears",
    "#{options[:ears]}_#{options[:body]}.png")

  nose_file = File.join(SPRITESHEET_DIR,
    "body",
    "#{options[:sex]}",
    "nose",
    "#{options[:nose]}_#{options[:body]}.png")

  facial_file = File.join(SPRITESHEET_DIR,
    "facial",
    "#{options[:sex]}",
    "#{options[:facial_type]}",
    "#{options[:facial_color]}.png")


  array.push(body_file) if options[:body] && File.exists?(body_file)
  array.push(eyes_file) if options[:eyes] && File.exists?(eyes_file)
  array.push(ears_file) if options[:ears] && File.exists?(ears_file)
  array.push(nose_file) if options[:nose] && File.exists?(nose_file)
  array.push(facial_file) if options[:facial_type] && options[:facial_color] && File.exists?(facial_file)

  return array
end
