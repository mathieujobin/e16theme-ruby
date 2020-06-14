module E16Theme
  class HtmlRenderer
    def initialize(theme_path, image_definitions, border_definitions, mode=nil)
      @theme_path = theme_path
      @image_definitions = image_definitions
      @border_definitions = border_definitions
      @mode = mode || found_modes.first
    end

    def draw_window_html
      #{draw_element(:TITLE_BAR_HORIZONTAL)}
      #{draw_element(:BAR_HORIZONTAL)}
      #{draw_element(:default_button)}
      #{draw_element(:BORDER_FIN)}
      #{draw_element(:BAR_TOP)}
      #{draw_element(:TITLEBAR)}
      %Q{
        <style>
        td {border: 0px solid red;}
        td.inside {background-color: darkgreen; }
        td.left {text-align: right; }
        tr.bottom td {vertical-align: top; }
        </style>
        <ul>
          #{found_modes_links}
        </ul>
        Available definitions: #{draw_all_window_types}
        <H3>Default definition</H3>
        #{draw_default_window}
        <H3>Recipe</H3>
        <pre>#{@border_definitions[E16Theme::BordersMethods::DEFAULT].to_yaml}</pre>
        <H3>Hardcoded table built from E13 example</H3>
        #{draw_e13_hardcoded_window}
      }
    end

    def border_types
      E16Theme::BordersMethods::MAIN_BORDER_TYPES
    end

    def draw_all_window_types
      border_types.select{|bt| @border_definitions[bt].present?}.map do |border_type|
        # "<H3>#{border_type}</H3>"
        # <pre>#{@border_definitions[border_type]&.keys}</pre>"
        border_type
      end.join(", ")
    end

    def draw_default_window
      @border_definitions[E16Theme::BordersMethods::DEFAULT][:parts].map do |part_name, part_def|
        #"#{part_name}<pre>#{part_def.inspect}</pre>#{draw_element(part_name)}"
        draw_element(part_name)
      end.join("")
    end

    def draw_e13_hardcoded_window
      %Q{
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
      img_link @image_definitions.dig(element, @mode.to_sym)
    end

    def img_link(link)
      image_path = "#{@theme_path}/#{link}"
      "<img src='#{image_path}' />" if !link.to_s.empty?
    end

    def found_modes
      @image_definitions.values.map {|v| v&.keys&.grep(/pix$/)}.flatten.uniq
    end

    def found_modes_links
      found_modes.map do |mode|
        "<li><a href=?mode=#{mode}>#{mode}</a></li>"
      end.join("\n")
    end
  end
end
