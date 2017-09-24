# Structure:
# options = {
#   sex: Symbol, # {:male | :female}
#   body: Symbol, # e.g. :light
#   eyes: Symbol, # e.g. :green
#   ears: Symbol  # e.g. :bigears
#   nose: Symbol, # e.g. :bignose
# }
def generate_body_filelist(options={})
  array = Array.new

  body_file = File.join(SPRITESHEET_DIR, "body", options[:sex], "#{options[:body]}.png")
  eyes_file = File.join(SPRITESHEET_DIR, "body", options[:sex], "eyes", "#{options[:eyes]}.png")
  ears_file = File.join(SPRITESHEET_DIR, "body", options[:sex], "ears", "#{options[:ears]}.png")
  nose_file = File.join(SPRITESHEET_DIR, "body", options[:sex], "nose", "#{options[:nose]}.png")

  return array
end
