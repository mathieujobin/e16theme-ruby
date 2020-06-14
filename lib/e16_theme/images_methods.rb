require 'yaml'

module E16Theme
  module ImagesMethods
    def BEGIN_IMAGE(image_tagname)
      @image_defs ||= {}
      puts "BEGIN_IMAGE: #{image_tagname}" if ENV['E16PARSEDEBUG']
      @image_defs[image_tagname] ||= {}
      @current_image = image_tagname
    end

    def image_definitions
      @image_defs
    end

    # fill rules for imageclasses
    def __SCALE          ; :scale           ; end
    def __STRETCH        ; :stretch         ; end
    def __TILE_H         ; :tile_h          ; end
    def __TILE_V         ; :tile_v          ; end
    def __TILE           ; :tile            ; end
    def __INTEGER_TILE_H ; :integer_tile_h  ; end
    def __INTEGER_TILE_V ; :integer_tile_v  ; end
    def __INTEGER_TILE   ; :integer_tile    ; end
    def __STRECH         ; :stretch         ; end  # typo found in themes

    def menuknopf_kill
      :menuknopf_kill
    end

    %w[
      IMAGE_NORMAL
      IMAGE_NORMAL_ACTIVE
      IMAGE_NORMAL_STICKY
      IMAGE_HILITED
      IMAGE_HILITED_ACTIVE
      IMAGE_HILITED_STICKY
      IMAGE_CLICKED
      IMAGE_CLICKED_ACTIVE
      IMAGE_CLICKED_STICKY
      IMAGE_NORMAL_ACTIVE_STICKY
      IMAGE_NORMAL_ACTIVE_HILITED
      IMAGE_NORMAL_ACTIVE_CLICKED
      IMAGE_HILITED_ACTIVE_STICKY
      IMAGE_CLICKED_ACTIVE_STICKY
    ].each do |method_name|
      define_method(method_name) do |pixfile, fill, left, right, top, bottom|
        @image_defs[@current_image][method_name] ||= {
          pix: pixfile,
          fill: fill,
          left: left,
          right: right,
          top: top,
          bottom: bottom
        }
      end
    end

    def IMAGE_PADDING(left, right, top, bottom)
      @image_defs[@current_image][:image_padding] = {
        left: left,
        right: right,
        top: top,
        bottom: bottom
      }
    end

    def IMAGE_BEVEL(bevel)
      @image_defs[@current_image][:image_bevel] = bevel
    end

    def IMAGE_ROTATE(rotate)
      @image_defs[@current_image][:image_rotate] = rotate
    end

    def IMAGE_FLIP(flip)
      @image_defs[@current_image][:image_flip] = flip
    end

    END_IMAGE=nil

    def image_inspect
      @image_defs.to_yaml
    end
  end
end
