require 'byebug' # rescue LoadError
module E16Theme
  class ThemeRepo
    def self.dirs
      Dir.glob("#{root_folder}/*/e16")
    end

    def self.root_folder
      if defined?(Rails) && Rails.respond_to?(:root)
        "#{Rails.root}/public/e16themes"
      else
        '/home/mathieu/projects/opensource/e13/E16/themes'
      end
    end

    def self.theme_path(theme_name)
      "#{root_folder}/#{theme_name}/e16"
    end

    def self.parser_for(theme_name)
      location = theme_path(theme_name)
      Dir.exists?(location) && E16Theme::Parser.new(location).tap(&:parse)
    rescue => e
      $stderr.puts "Could not create parser for #{theme_name}."
      raise e
    end
  end
end
