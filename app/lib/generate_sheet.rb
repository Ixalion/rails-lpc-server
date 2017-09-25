require "oily_png"

require "generate/helper"
require "generate/body_filelist"


module SpritesheetGenerator

  # Structure:
  # options = {
  #   body: Hash, # See generate_body_filelist
  # }
  def self.generate_full_filelist(options={})
    array = Array.new

    options[:body] ||= Hash.new
    array.concat(generate_body_filelist(options[:body]))
  end
end
