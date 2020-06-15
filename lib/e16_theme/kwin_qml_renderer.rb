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
      ERB.new(template).result(template_variables)
    end

    def main_xml_content
      template = File.read("#{templates_folder}/main.xml.erb")
      ERB.new(template).result(template_variables)
    end

    def main_qml_content
      template = File.read("#{templates_folder}/main.qml.erb")
      ERB.new(template).result(template_variables)
    end

    def template_variables
      OpenStruct.new(self).instance_eval { binding }
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
