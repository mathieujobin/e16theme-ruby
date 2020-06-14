module E16Theme
  class Parser
    attr_reader :theme_path

    def initialize(theme_path)
      @theme_path = theme_path
      ensure_theme_location
    end

    include ImagesMethods
#    include BordersMethods

    def parse
      puts images_content
      eval images_content
      puts borders_content
      eval borders_content
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
