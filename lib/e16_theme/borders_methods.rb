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

    BORDERLESS="borderless"
    BORDER_CHANGES_SHAPE=:BORDER_CHANGES_SHAPE
    ACTION_KILL=:ACTION_KILL
    BUTTON_KILL=:BUTTON_KILL
    KILL=:KILL

    BUTTON_SHADE=:BUTTON_SHADE
    ACTION_SHADE=:ACTION_SHADE
    SHADE=:SHADE

    BUTTON_ICONIFY=:BUTTON_ICONIFY
    ACTION_ICONIFY=:ACTION_ICONIFY
    ICONIFY=:ICONIFY

    BUTTON_STICK=:BUTTON_STICK
    ACTION_STICK=:ACTION_STICK

    WIN_SIDE_LEFT=:WIN_SIDE_LEFT
    WIN_SIDE_RIGHT=:WIN_SIDE_RIGHT
    RESIZE_H=:resize_h
    RESIZE_TR=:RESIZE_TR
    RESIZE_BR=:RESIZE_BR
    RESIZE_V=:resize_v
    ACTION_RESIZE_V=:resize_v
    ACTION_RESIZE_H=:resize_h
    ACTION_RESIZE=:resize_h
    #   RESIZE_W=:resize_w

    ACTION_MOVE=:ACTION_MOVE
    MOVE=:MOVE

    WIN_CORNER_BL=:WIN_CORNER_BL
    WIN_CORNER_BR=:WIN_CORNER_BR
    WIN_BOTTOM=:WIN_BOTTOM

    TITLEBAR=:title_bar
    BAR_TOP=:bar_top
    BAR_VERTICAL=:bar_vertical

    BUTTON_BLACK=:BUTTON_BLACK

    ICONBOX=nil
    PAGER=nil
    PAGER_RIGHT=nil
    PB1=nil
    PB2=nil
    PB3=nil
    PB4=nil
    PB5=nil
    PB6=nil
    PB7=nil
    PB8=nil
    FIXED_FRAME=nil
    FIXED_SIZE=nil
    TEXT1=nil
    FIN=nil
    SHAPED=nil
    TRANSIENT=nil
    END_BORDER=nil
    END_BORDER_PART=nil
    DEFAULT="default"

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
