require "e16_theme/version"
require "e16_theme/borders_methods"
require "e16_theme/images_methods"
require "e16_theme/widget_styling"
require "e16_theme/dock_configurator"
require "e16_theme/theme_specific"
require "e16_theme/parser"
require 'e16_theme/theme_repo'
require "e16_theme/rails_engine" if defined?(Rails)
require "e16_theme/base_renderer"
require "e16_theme/html_renderer"
require "e16_theme/kwin_qml_renderer"

class NilClass
  def present?
    false
  end
end

module E16Theme
  class Error < StandardError; end
  # Your code goes here...
end
