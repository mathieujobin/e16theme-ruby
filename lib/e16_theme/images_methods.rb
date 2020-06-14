module E16Theme
  module ImagesMethods
    def BEGIN_IMAGE(image_tagname)
      puts "BEGIN_IMAGE: #{image_tagname}"
#       yield
    end

    def __STRETCH
      nil
    end
    def IMAGE_NORMAL(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_NORMAL_ACTIVE(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_NORMAL_STICKY(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_HILITED(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_HILITED_ACTIVE(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_HILITED_STICKY(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_CLICKED(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_CLICKED_ACTIVE(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_CLICKED_STICKY(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_NORMAL_ACTIVE_STICKY(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_NORMAL_ACTIVE_HILITED(a,b,c,d,e,f)
      puts a
    end
    def IMAGE_NORMAL_ACTIVE_CLICKED(a,b,c,d,e,f)
      puts a
    end

    def IMAGE_PADDING(a,b,c,d)
      nil
    end

    END_IMAGE=nil

    TITLE_BAR_HORIZONTAL=:TITLE_BAR_HORIZONTAL

  end
end
