require_relative "helper"

module SpritesheetGenerator

  # Structure:
  # options = {
  #   sex: Symbol, # {:male | :female}
  #   body: Symbol, # e.g. :light
  #   eyes: Symbol, # e.g. :green
  #   ears: Symbol, # e.g. :bigears
  #   nose: Symbol  # e.g. :bignose
  # }
  def self.generate_body_filelist(options={})
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


    array.push(body_file) if options[:body] && File.exists?(body_file)
    array.push(eyes_file) if options[:eyes] && File.exists?(eyes_file)
    array.push(ears_file) if options[:ears] && File.exists?(ears_file)
    array.push(nose_file) if options[:nose] && File.exists?(nose_file)

    return array
  end

  def self.body_filelist_from_body_type(body_type)
    options = {
      sex: body_type.sex,
      body: body_type.body
    }

    options[:nose] = body_type.nose unless body_type.nose_default?
    options[:eyes] = body_type.eyes unless body_type.eyes_default?
    options[:ears] = body_type.ears unless body_type.ears_default?

    return generate_body_filelist(options)
  end
end
