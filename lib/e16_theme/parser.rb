module E16Theme
  class Parser
    attr_reader :theme_path

    def initialize(theme_path)
      @theme_path = theme_path
      ensure_theme_location
    end

    include ImagesMethods
    include BordersMethods
    include WidgetStyling
    include DockConfigurator
    include ThemeSpecific

    def parse
      puts images_content if ENV['E16PARSEDEBUG']
      eval images_content
      puts "*" * 50 if ENV['E16PARSEDEBUG']
      puts borders_content if ENV['E16PARSEDEBUG']
      eval borders_content
      puts image_inspect if ENV['E16PARSEDEBUG']
    end

    def available_modes
      @available_modes ||= image_definitions.values.map {|v| v&.keys&.grep(/^IMAGE_/)}.flatten.uniq
    end

    def first_available_mode
      available_modes.first
    end

    def border_size_left
      border_definitions[:default_definition][:border_size_left]
    end

    def border_size_right
      border_definitions[:default_definition][:border_size_right]
    end

    def border_size_top
      border_definitions[:default_definition][:border_size_top]
    end

    def border_size_bottom
      border_definitions[:default_definition][:border_size_bottom]
    end

    def parts
      border_definitions[:default_definition][:parts]
    end

    def display_all_parts(mode)
      parts.map do |image, border_part_info|
        border_part_to_rectangle(image, border_part_info, mode.to_s)
      end.join("\n")
    end

    def border_part_to_rectangle(image, border_part_info, mode)
      if border_part_info[:max_width] == border_part_info[:min_width]
        width = "width: #{border_part_info[:max_width]}"
      else
        width = "fillMode: Image.PreserveAspectFit"
      end
      if border_part_info[:max_height] == border_part_info[:min_height]
        height = "height: #{border_part_info[:max_height]}"
      elsif width != "fillMode: Image.PreserveAspectFit"
        height = "fillMode: Image.PreserveAspectFit"
      end
      "
      Rectangle { Image {
        //#{border_part_info.inspect}
        #{width}
        #{height}
        source: '#{source_image(image, mode)}'
      }}
      "
    end

    def source_image(image, mode)
      "#{theme_path}/#{image_definitions.dig(image, mode.to_s, :pix)}"
    end

    def ensure_theme_location
      unless File.exists?("#{theme_path}/#{images_file}")
        puts "give me a path where I can find #{borders_file} and #{images_file}"
        puts "not found in #{theme_path}"
        exit 1
      end
      unless File.exists?("#{theme_path}/#{borders_file}")
        puts "give me a path where I can find #{borders_file} and #{images_file}"
        puts "not found in #{theme_path}"
        exit 1
      end
    end

    def borders_content
      @borders_content ||= _config_content(borders_file)
    end

    def images_content
      @images_content ||= _config_content(images_file)
    end

    def _config_content(filename)
      File.read("#{theme_path}/#{filename}").gsub(/#include <([^>]*)>/, "etheme_load_include('\\1')")
    end

    def __E_CFG_VERSION(*args)
      unless args == [1]
        puts args.inspect
      end
    end

    def etheme_load_include(configfile)
      unless configfile == 'definitions'
        puts "###### BEGIN PARSING #{configfile} <<<<" if ENV['E16PARSEDEBUG']
        eval File.read("#{theme_path}/#{configfile}")
      end
    end

    def borders_file
      "borders.cfg"
    end

    def images_file
      "imageclasses.cfg"
    end

    def definitions_file
      "/home/mathieu/projects/opensource/KDE/kwin/plugins/kdecorations/aurorae/src/e16/config/definitions"
    end
  end
end
