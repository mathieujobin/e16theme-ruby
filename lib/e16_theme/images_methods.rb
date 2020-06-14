require 'yaml'

module E16Theme
  module ImagesMethods
    def BEGIN_IMAGE(image_tagname)
      @image_defs ||= {}
      puts "BEGIN_IMAGE: #{image_tagname}" if ENV['E16PARSEDEBUG']
      @image_defs[image_tagname] ||= {}
      @current_image = image_tagname
    end

    def __STRETCH
      :stretch
    end

    def IMAGE_NORMAL(a,b,c,d,e,f)
      @image_defs[@current_image][:normal_pix] = a
      @image_defs[@current_image][:normal_meta] = [b,c,d,e,f]
    end
    def IMAGE_NORMAL_ACTIVE(a,b,c,d,e,f)
      @image_defs[@current_image][:active_pix] = a
      @image_defs[@current_image][:active_meta] = [b,c,d,e,f]
    end
    def IMAGE_NORMAL_STICKY(a,b,c,d,e,f)
      @image_defs[@current_image][:sticky_pix] = a
      @image_defs[@current_image][:sticky_meta] = [b,c,d,e,f]
    end
    def IMAGE_HILITED(a,b,c,d,e,f)
      @image_defs[@current_image][:hilited_pix] = a
      @image_defs[@current_image][:hilited_meta] = [b,c,d,e,f]
    end
    def IMAGE_HILITED_ACTIVE(a,b,c,d,e,f)
      @image_defs[@current_image][:hilited_active_pix] = a
      @image_defs[@current_image][:hilited_active_meta] = [b,c,d,e,f]
    end
    def IMAGE_HILITED_STICKY(a,b,c,d,e,f)
      @image_defs[@current_image][:hilited_sticky_pix] = a
      @image_defs[@current_image][:hilited_sticky_meta] = [b,c,d,e,f]
    end
    def IMAGE_CLICKED(a,b,c,d,e,f)
      @image_defs[@current_image][:clicked_pix] = a
      @image_defs[@current_image][:clicked_meta] = [b,c,d,e,f]
    end
    def IMAGE_CLICKED_ACTIVE(a,b,c,d,e,f)
      @image_defs[@current_image][:clicked_active_pix] = a
      @image_defs[@current_image][:clicked_active_meta] = [b,c,d,e,f]
    end
    def IMAGE_CLICKED_STICKY(a,b,c,d,e,f)
      @image_defs[@current_image][:clicked_sticky_pix] = a
      @image_defs[@current_image][:clicked_sticky_meta] = [b,c,d,e,f]
    end
    def IMAGE_NORMAL_ACTIVE_STICKY(a,b,c,d,e,f)
      @image_defs[@current_image][:active_sticky_pix] = a
      @image_defs[@current_image][:active_sticky_meta] = [b,c,d,e,f]
    end
    def IMAGE_NORMAL_ACTIVE_HILITED(a,b,c,d,e,f)
      @image_defs[@current_image][:active_hilited_pix] = a
      @image_defs[@current_image][:active_hilited_meta] = [b,c,d,e,f]
    end
    def IMAGE_NORMAL_ACTIVE_CLICKED(a,b,c,d,e,f)
      @image_defs[@current_image][:active_clicked_pix] = a
      @image_defs[@current_image][:active_clicked_meta] = [b,c,d,e,f]
    end

    def IMAGE_PADDING(a,b,c,d)
#       puts {a: a, b: b, c: c, d: d}.inspect
    end

    END_IMAGE=nil

    def image_inspect
      @image_defs.to_yaml
    end
  end
end
