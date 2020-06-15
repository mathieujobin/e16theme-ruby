module E16Theme
  class BaseRenderer
    def initialize(theme_path, image_definitions, border_definitions, mode=nil)
      @theme_path = theme_path
      @image_definitions = image_definitions
      @border_definitions = border_definitions
      @mode = mode || found_modes.first
    end

    def found_modes
      @image_definitions.values.map {|v| v&.keys&.grep(/^IMAGE_/)}.flatten.uniq
    end
  end
end
