module E16Theme
  class KwinQmlRenderer < BaseRenderer

    def write_contents
      File.open("#{common_install_path}/#{dir_name}/metadata.desktop", "wb+") do |f|
        f.write metadata_desktop_content
      end
      File.open("#{common_install_path}/#{dir_name}/contents/config/main.xml", "wb+") do |f|
        f.write main_xml_content
      end
      File.open("#{common_install_path}/#{dir_name}/contents/ui/main.qml", "wb+") do |f|
        f.write main_qml_content
      end
    end

    def metadata_desktop_content
      template = File.read("#{templates_folder}/metadata.desktop.erb")
      ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
    end

    def main_xml_content
      template = File.read("#{templates_folder}/main.xml.erb")
    end

    def main_qml_content
      template = File.read("#{templates_folder}/main.qml.erb")
    end

    def dir_name
      "kwin4_decoration_qml_#{theme_name}"
    end

    def common_install_path
      "/usr/share/kwin/decorations/"
    end

    def templates_folder
      "#{__dir__}/qml_templates"
    end
  end
end
