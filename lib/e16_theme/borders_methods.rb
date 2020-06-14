module E16Theme
  module BordersMethods
    def BEGIN_BORDER(*args)
      puts args.inspect
    end

    def BORDER_CHANGES_SHAPE(*args)
      puts args.inspect
    end

    def BORDER_SHADE_DIRECTION(*args)
      puts args.inspect
    end

    def method_missing(method_name, *args)
      case method_name.to_sym
      when :BORDER_CHANGES_SHAPE
      when :BEGIN_BORDER_PART
      when :BORDER_PART_REGION
      when :BORDER_PART_CURSOR
      when :BORDER_PART_ACTION
      when :BORDER_PART_KEEP_WHEN_SHADED
      when :BORDER_PART_TITLE
        puts [method_name, args].inspect
      else
        raise method_name.inspect
      end
    end

    def xBORDERLESS(*args)
      puts args.inspect
    end

    private

    ### Main borders elements (images)
    TITLE_BAR_HORIZONTAL=:title_bar_horizontal
    BAR_VERTICAL=:bar_vertical
    BAR_HORIZONTAL=:bar_horizontal
    BAR_TOP=:bar_top
    TITLEBAR=:title_bar
    FIN=:border_fin
    WIN_TOP_TITLE=:win_top_title
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
    BORDERLESS=:borderless
    END_BORDER=:end_border
    END_BORDER_PART=nil
    DEFAULT="default"
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
    TEXT1=nil

    RESIZE_H=:resize_h
    RESIZE_TR=:RESIZE_TR
    RESIZE_BR=:RESIZE_BR
    RESIZE_V=:resize_v
    ACTION_RESIZE_V=:resize_v
    ACTION_RESIZE_H=:resize_h
    ACTION_RESIZE=:resize_h
    RESIZE_W=:resize_w

    FIXED_FRAME=nil
    FIXED_SIZE=nil

    ICONBOX=:iconbox_definition
    PAGER=:pager_definition
    PAGER_RIGHT=nil
    SHAPED=nil
    TRANSIENT=nil
    BUTTON_SLIDEOUT=nil
    ACTION_WINDOW_SLIDEOUT=nil

    def __UP
      :up
    end

    def __LEFT
      :left
    end

    def __ON
      true
    end

    def __OFF
      false
    end
  end
end
