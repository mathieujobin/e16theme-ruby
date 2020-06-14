module E16Theme
  class HtmlRenderer
    def initialize(image_definitions, border_definitions)
      @image_definitions = image_definitions
      @border_definitions = border_definitions
    end

    def draw_window_html
      %Q{
        #{draw_element(:TITLE_BAR_HORIZONTAL)}
        #{draw_element(:BAR_VERTICAL)}
        #{draw_element(:BAR_HORIZONTAL)}
        #{draw_element(:BAR_TOP)}
        #{draw_element(:TITLEBAR)}
        #{draw_element(:WIN_TOP_TITLE)}
        #{draw_element(:WIN_BOTTOM)}
      }
    end

    def draw_element(element)
    end
  end
end
