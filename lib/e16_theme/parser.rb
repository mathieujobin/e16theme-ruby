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
