E16Theme::RailsEngine.routes.draw do
  get '/test', :to => Rack::ContentLength.new(
    proc do |env|
      [200, {}, ['ok']]
    end
  )
  get '/error', :to => Rack::ContentLength.new(
    proc do |env|
      [500, {}, ['oups']]
    end
  )
  get '/', :to => Rack::ContentLength.new(proc { |env| E16Theme::RailsEngine.index_page })
  get '/theme/show', :to => Rack::ContentLength.new(proc { |env| E16Theme::RailsEngine.theme_show(env) })
  get '/theme/author', :to => Rack::ContentLength.new(proc { |env| E16Theme::RailsEngine.theme_author(env) })
  get '/theme/kwin-qml', :to => Rack::ContentLength.new(proc { |env| E16Theme::RailsEngine.theme_qml(env) })
end
