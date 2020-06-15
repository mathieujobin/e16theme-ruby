module E16Theme
  class BaseRenderer
    def initialize(theme_name, theme_path, parser, mode=nil)
      @theme_name = theme_name
      @theme_path = theme_path
      @parser = parser
      @image_definitions = parser.image_definitions
      @border_definitions = parser.border_definitions
      @mode = mode || found_modes.first
    end

    def found_modes
      @image_definitions.values.map {|v| v&.keys&.grep(/^IMAGE_/)}.flatten.uniq
    end
  end
end
