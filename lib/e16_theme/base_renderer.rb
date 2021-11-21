module E16Theme
  class BaseRenderer
    attr_reader :theme_name, :theme_path, :parser, :mode,
        :image_definitions, :border_definitions

    def initialize(theme_name, theme_path, parser, mode=nil)
      @theme_name = theme_name
      @theme_path = theme_path
      @parser = parser
      @image_definitions = parser.image_definitions
      @border_definitions = parser.border_definitions
      @mode = mode || parser.first_available_mode
    end
  end
end
