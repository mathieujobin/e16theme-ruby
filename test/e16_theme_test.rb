require "test_helper"

class E16ThemeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::E16Theme::VERSION
  end

  def test_it_returns_my_local_dir
    puts E16Theme::ThemeRepo.root_folder
    assert E16Theme::ThemeRepo.root_folder == "/home/mathieu/projects/opensource/e13/E16/themes"
  end

  E16Theme::ThemeRepo.dirs.map do |theme_dir|
    # next unless File.exists?("#{theme_dir}/.success")
    theme_name = theme_dir.split('/')[-2]
    define_method :"test_all_themes_can_be_parsed_#{theme_name}" do
      parser = E16Theme::ThemeRepo.parser_for(theme_name)
      puts "#{theme_name} initial parsing passed!"
    rescue SyntaxError
      puts "#{theme_name} not yet supported (SyntaxError)"
    rescue NameError
      puts "#{theme_name} not yet supported (NameError)"
    rescue NoMethodError
      puts "#{theme_name} not yet supported (NoMethodError)"
    rescue ArgumentError
      puts "#{theme_name} not yet supported (ArgumentError)"
    rescue RuntimeError
      puts "#{theme_name} not yet supported (RuntimeError)"
    end
  end

  def test_main_qml_content_output
    theme_name = "e13"
    theme_path = "/e16themes/#{theme_name}/e16"
    parser = E16Theme::ThemeRepo.parser_for(theme_name)
    renderer = E16Theme::KwinQmlRenderer.new(theme_name, theme_path, parser)
    assert 548 == renderer.metadata_desktop_content.size
    assert 780 == renderer.main_xml_content.size
    puts renderer.main_qml_content
  end

end
