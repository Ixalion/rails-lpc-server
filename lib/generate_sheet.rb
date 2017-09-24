require "oily_png"

require "generate/helper"
require "generate/body_filelist"


# Structure:
# options = {
#   body: Hash, # See generate_body_filelist
# }
def generate_full_filelist(options={})
  array = Array.new

  array.concat(generate_body_filelist(options[:body]))
end
