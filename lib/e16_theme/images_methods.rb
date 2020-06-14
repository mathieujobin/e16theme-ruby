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

    def __STRETCH
      :stretch
    end

    def __STRECH
      :stretch
    end

    def __TILE_H
      :tile_h
    end

    def __TILE
      :tile
    end

    def __SCALE
      :scale
    end

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
      define_method(method_name) do |*args|
        @image_defs[@current_image][method_name] ||= {}
        @image_defs[@current_image][method_name][:pix] = args.shift
        @image_defs[@current_image][method_name][:meta] = args
      end
    end

    def IMAGE_PADDING(a,b,c,d)
      @image_defs[@current_image][:image_padding] = {a: a, b: b, c: c, d: d}
    end

    END_IMAGE=nil

    def image_inspect
      @image_defs.to_yaml
    end
  end
end
