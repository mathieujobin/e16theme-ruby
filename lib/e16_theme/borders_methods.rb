module E16Theme
  module BordersMethods
    def border_definitions
      @border_defs || {}
    end

    def BEGIN_BORDER(name, left, right, top, bottom)
      raise "wait" if name.nil?
      @current_border = name
      @border_defs ||= {}
      @border_defs[@current_border] ||= {
        border_size_left: left,
        border_size_right: right,
        border_size_top: top,
        border_size_bottom: bottom
      }
    end

    def BORDER_CHANGES_SHAPE(*args)
      @border_defs[@current_border] ||= {}
      @border_defs[@current_border][:BORDER_CHANGES_SHAPE] = args.first
    end

    def BORDER_SHADE_DIRECTION(*args)
      @border_defs[@current_border] ||= {}
      @border_defs[@current_border][:BORDER_SHADE_DIRECTION] = args.first
    end

    def BEGIN_BORDER_PART(part_name, min_width, max_width, min_height, max_height)
      @part_name = part_name # also known as iclass
      @border_defs[@current_border] ||= {}
      @border_defs[@current_border][:parts] ||= {} # {@part_name => {}}
      min_max = {
        min_width: min_width,
        max_width: max_width,
        min_height: min_height,
        max_height: max_height
      }
      @border_defs[@current_border][:parts][@part_name] ||= min_max
    end

    def BORDER_PART_REGION(o1, x1p, x1, y1p, y1, o2, x2p, x2, y2p, y2)
      oyx = {
        topleft_origin: o1,
        topleft_x_percentage: x1p,
        topleft_x_absolute: x1,
        topleft_y_percentage: y1p,
        topleft_y_absolute: y1,
        bottomright_origin: o2,
        bottomright_x_percentage: x2p,
        bottomright_x_absolute: x2,
        bottomright_y_percentage: y2p,
        bottomright_y_absolute: y2
      }
      @border_defs[@current_border][:parts][@part_name][:BORDER_PART_REGION] ||= oyx
    end

    def method_missing(method_name, *args)
      args.unshift(method_name)
      case method_name.to_sym
      when :BORDER_PART_CURSOR
      when :BORDER_PART_ACTION
      when :BORDER_PART_KEEP_WHEN_SHADED
      when :BORDER_PART_TITLE
        @border_defs[@current_border][:parts][@part_name][method_name] = args
      else
        raise method_name.inspect
      end
    end

    ### Main borders elements (images)
    TITLE_BAR_HORIZONTAL=:TITLE_BAR_HORIZONTAL
    BAR_VERTICAL=:BAR_VERTICAL
    BAR_HORIZONTAL=:BAR_HORIZONTAL
    BAR_TOP=:BAR_TOP
    TITLEBAR=:TITLE_BAR
    FIN=:BORDER_FIN
    WIN_TOP_TITLE=:WIN_TOP_TITLE
    WIN_BOTTOM=:WIN_BOTTOM
    WIN_SIDE_LEFT=:WIN_SIDE_LEFT
    WIN_SIDE_RIGHT=:WIN_SIDE_RIGHT
    WIN_CORNER_BL=:WIN_CORNER_BL
    WIN_CORNER_BR=:WIN_CORNER_BR

    ### Border buttons (images)
    BUTTON_KILL=:BUTTON_KILL
    BUTTON_SHADE=:BUTTON_SHADE
    BUTTON_ICONIFY=:BUTTON_ICONIFY
    BUTTON_STICK=:BUTTON_STICK
    BUTTON=:default_button

    # Pager buttons (images)
    PB1=:pager_button1
    PB2=:pager_button2
    PB3=:pager_button3
    PB4=:pager_button4
    PB5=:pager_button5
    PB6=:pager_button6
    PB7=:pager_button7
    PB8=:pager_button8

    # Borders default definitions
    BORDERLESS=:borderless_definition
    DEFAULT=:default_definition
    FIXED_FRAME=:fixed_frame_definition
    FIXED_SIZE=:fixed_size_definition
    ICONBOX=:iconbox_definition
    PAGER=:pager_definition
    PAGER_RIGHT=:pager_right_definition
    SHAPED=:shaped_definition
    TRANSIENT=:transient_definition

    MAIN_BORDER_TYPES=[
      BORDERLESS, DEFAULT, FIXED_FRAME, FIXED_SIZE, ICONBOX, PAGER, PAGER_RIGHT, SHAPED, TRANSIENT
    ]

    END_BORDER=:end_border
    END_BORDER_PART=nil
    BORDER_CHANGES_SHAPE=:BORDER_CHANGES_SHAPE
    KILL=:KILL
    ACTION_KILL=:ACTION_KILL
    ICONIFY=:ICONIFY
    ACTION_ICONIFY=:ACTION_ICONIFY
    SHADE=:SHADE
    ACTION_SHADE=:ACTION_SHADE
    ACTION_STICK=:ACTION_STICK

    ACTION_MOVE=:ACTION_MOVE
    MOVE=:MOVE
    TEXT1=:text1

    RESIZE_H=:resize_h
    RESIZE_TR=:RESIZE_TR
    RESIZE_BR=:RESIZE_BR
    RESIZE_V=:resize_v
    ACTION_RESIZE_V=:resize_v
    ACTION_RESIZE_H=:resize_h
    ACTION_RESIZE=:resize_h
    RESIZE_W=:resize_w


    BUTTON_SLIDEOUT=:button_slideout
    ACTION_WINDOW_SLIDEOUT=:action_window_slideout

    def __TOP
      :top
    end

    def __BOTTOM
      :bottom
    end

    def __UP
      :up
    end

    def __DOWN
      :down
    end

    def __LEFT
      :left
    end

    def __RIGHT
      :right
    end

    def __ON
      true
    end

    def __OFF
      false
    end
  end
end
