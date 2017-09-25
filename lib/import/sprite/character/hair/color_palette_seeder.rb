class Sprite::Character::Hair::ColorPaletteSeeder
  using RubyExt

  def find_color_option(template_value)
    {
      Sprite::Character::Hair::ColorPalette::TEMPLATE_VERY_DARK => :very_dark,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_DARK => :dark,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_MEDIUM_DARK => :medium_dark,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_MEDIUM_DARK_TRANSPARENT => :medium_dark_transparent,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_MEDIUM_LIGHT => :medium_light,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_LIGHT => :light,
      Sprite::Character::Hair::ColorPalette::TEMPLATE_VERY_LIGHT => :very_light
    }[template_value]
  end

  def parse_color_type(str)
    str = str.gsub("#","")
    str = "#{str}FF" if str.length == 6

    return str.to_si(16, 32)
  end

  def seed_files
    palette_path = File.join(Rails.root, "spritesheet", "_build", "hair", "palettes.json")

    json_data = File.read(palette_path)

    parsed_hash = JSON.parse(json_data)

    parsed_hash.keys.each do |key|
      args = Hash.new
      args[:name] = key
      parsed_hash[key].keys.each do |template|
        args[find_color_option(parse_color_type(template))] = parse_color_type(parsed_hash[key][template])
      end

      color_palette = Sprite::Character::Hair::ColorPalette.find_or_create_by(args)
      puts "Successfully created: #{color_palette.inspect}"
    end
  end
end
