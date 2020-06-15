# in your rails app
#   mount E16Theme::RailsEngine => '/e16'
module E16Theme
  class RailsEngine < ::Rails::Engine
    engine_name 'e16_theme_viewer'
    isolate_namespace E16Theme

    def self.index_page
      dirs = Dir.glob("#{Rails.root}/public/e16themes/*/e16")
      e16_theme_links = dirs.map do |theme_dir|
        next unless File.exists?("#{theme_dir}/.success")
        theme_name = theme_dir.split('/')[-2]
        "<li>
            <a href='/e16/theme/show?name=#{theme_name}'>#{theme_name}</a>
            <a href='/e16/theme/author?name=#{theme_name}'>[about:author]</a>
        </li>"
      end
      render_html(%Q{
                 <h1>E16 window decoration showdown</h1>
                 <p>These themes could be available under KDE Plasma as kwin decoration.</p>
                 <p>What do you think of this idea? can you help writing the decorator for kwin?</p>
                 <ul>
                  #{e16_theme_links.join("\n")}
                 </ul>
      })
    end

    def self.theme_show(env)
      theme_name = params(env)["name"]
      theme_path = "#{Rails.root}/public/e16themes/#{theme_name}/e16"
      if Dir.exists?(theme_path)
        parser = E16Theme::Parser.new(theme_path)
        parser.parse
        renderer = E16Theme::HtmlRenderer.new(
          "/e16themes/#{theme_name}/e16", parser.image_definitions, parser.border_definitions, params(env)['mode'])
        render_html renderer.draw_window_html
      else
        render_404
      end
    end

    def self.theme_author(env)
      theme_name = params(env)["name"]
      author_file = "#{Rails.root}/public/e16themes/#{theme_name}/e16/ABOUT/MAIN"
      if File.exists?(author_file)
        render_html File.read(author_file)
      else
        render_404 "author not found?"
      end
    end

    def self.render_html(output)
      [200, {"Content-Type" => 'text/html'}, [output]]
    end

    def self.render_404(text='Not Found')
      [404, {}, [text]]
    end

    def self.params(env)
      Rack::Utils.parse_nested_query env["QUERY_STRING"]
    end
  end
end
