module E16Theme
  class HtmlRenderer
    def initialize(theme_path, image_definitions, border_definitions)
      @theme_path = theme_path
      @image_definitions = image_definitions
      @border_definitions = border_definitions
    end

    def draw_window_html
      #{draw_element(:TITLE_BAR_HORIZONTAL)}
      #{draw_element(:BAR_HORIZONTAL)}
      #{draw_element(:default_button)}
      #{draw_element(:BORDER_FIN)}
      #{draw_element(:BAR_TOP)}
      #{draw_element(:TITLEBAR)}
      %Q{
        #{found_modes}

        <style>
        td {border: 0px solid red;}
        td.inside {background-color: darkgreen; }
        td.left {text-align: right; }
        tr.bottom td {vertical-align: top; }
        </style>
        <table border=0 cellpadding=0 cellspacing=0>
          <tr class='top'>
            <td class='left'>
              #{draw_element(:BUTTON_KILL)}
            </td>
            <td>
              #{draw_element(:WIN_TOP_TITLE)}
            </td>
          </tr>
          <tr>
            <td class='left'>
              #{draw_element(:BUTTON_ICONIFY)}
            </td>
            <td rowspan=5 class='inside'></td>
            <td rowspan=5>
              #{draw_element(:WIN_SIDE_RIGHT)}
            </td>
          </tr>
          <tr>
            <td class='left'>
              #{draw_element(:BUTTON_SHADE)}
            </td>
          </tr>
          <tr>
            <td class='left'>
              #{draw_element(:BUTTON_STICK)}
            </td>
          </tr>
          <tr>
            <td class='left'>
              #{draw_element(:WIN_SIDE_LEFT)}
            </td>
          </tr>
          <tr>
            <td class='left'>
              #{draw_element(:BAR_VERTICAL)}
            </td>
          </tr>
          <tr class='bottom'>
            <td class='left'>
              #{draw_element(:WIN_CORNER_BL)}
            </td>
            <td>
              #{draw_element(:WIN_BOTTOM)}
            </td>
            <td>
              #{draw_element(:WIN_CORNER_BR)}
            </td>
          </tr>
        </table>
      }
    end

    def draw_element(element)
      if @border_definitions[element].present?
        puts @border_definitions[element]
      end
      img_link @image_definitions.dig(element, :clicked_pix)
    end

    def img_link(link)
      image_path = "#{@theme_path}/#{link}"
      "<img src='#{image_path}' />" if !link.to_s.empty? && File.exists?(image_path)
    end

    def found_modes
      @image_definitions.values.map {|v| v&.keys&.grep(/pix$/)}.flatten.uniq
    end
  end
end
