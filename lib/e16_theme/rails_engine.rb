# in your rails app
#   mount E16Theme::RailsEngine => '/e16'
module E16Theme
  class RailsEngine < ::Rails::Engine
    engine_name 'e16_theme_viewer'
    isolate_namespace E16Theme

    def self.index_page
      e16_theme_links = ThemeRepo.dirs.map do |theme_dir|
        next unless File.exists?("#{theme_dir}/.success")
        theme_name = theme_dir.split('/')[-2]
        "<li>
            <a href='/e16/theme/show?name=#{theme_name}'>#{theme_name}</a>
            [<a href='/e16/theme/author?name=#{theme_name}'>about:author</a>]
            [<a href='/e16/theme/kwin-qml?name=#{theme_name}'>KDE Plasma / kwin QML decoration</a>]
        </li>"
      end
      render_200(%Q{
                 <h1>E16 window decoration showdown</h1>
                 <p>These themes could be available under KDE Plasma as kwin decoration.</p>
                 <p>What do you think of this idea? can you help writing the decorator for kwin?</p>
                 <ul>
                  #{e16_theme_links.join("\n")}
                 </ul>
      })
    end

    def self.theme_show(env)
      with_theme_path(env) do |theme_name, parser|
        renderer = E16Theme::HtmlRenderer.new(
          theme_name, "/e16themes/#{theme_name}/e16", parser, params(env)['mode'])
        render_200 renderer.draw_window_html
      end
    end

    def self.theme_author(env)
      theme_name = params(env)["name"]
      author_file = "#{Rails.root}/public/e16themes/#{theme_name}/e16/ABOUT/MAIN"
      if File.exists?(author_file)
        render_200 File.read(author_file)
      else
        render_404 "author not found?"
      end
    end

    def self.theme_qml(env)
      with_theme_path(env) do |theme_name, parser|
        renderer = E16Theme::KwinQmlRenderer.new(
          theme_name, "/e16themes/#{theme_name}/e16", parser, params(env)['mode'])
        render_200 %Q{
          <a href="/e16/theme/show?name=#{theme_name}">show #{theme_name}</a>
          <a href="/e16">back to list</a>
          <h3>/metadata.desktop</h3>
          <pre>
            #{renderer.metadata_desktop_content rescue "problem parsing theme"}
          </pre>
          <h3>/contents/config/main.xml</h3>
          <pre>
            #{renderer.main_xml_content rescue "problem parsing theme"}
          </pre>
          <h3>/contents/ui/main.qml</h3>
          <pre>
            #{renderer.main_qml_content rescue "problem parsing theme"}
          </pre>
        }
      end
    end

    def self.main_qml(env)
      with_theme_path(env) do |theme_name, parser|
        render_200(
          E16Theme::KwinQmlRenderer.new(
            theme_name, "/e16themes/#{theme_name}/e16", parser, params(env)['mode']
          ).main_qml_content, 'text/plain'
        )
      end
    end

    def self.with_theme_path(theme_name)
      if parser = E16Theme::ThemeRepo.parser_for(theme_name)
        yield theme_name, parser
      else
        render_404
      end
    end

    def self.render_200(output, content_type='text/html')
      [200, {"Content-Type" => content_type}, [output]]
    end

    def self.render_404(text='Not Found')
      [404, {}, [text]]
    end

    def self.theme_name_from_params
      params(env)["name"]
    end

    def self.params(env)
      Rack::Utils.parse_nested_query env["QUERY_STRING"]
    end
  end
end
