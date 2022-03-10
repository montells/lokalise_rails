# frozen_string_literal: true

require 'fileutils'

module FileManager
  def add_translation_files!
    FileUtils.mkdir_p "#{Rails.root}/config/locales/nested/"
    File.open("#{Rails.root}/config/locales/nested/en.yml", 'w+UTF-8') do |f|
      f.write en_data
    end
  end

  def expect_file_exist(path, file)
    file_path = File.join path, file
    expect(File.file?(file_path)).to be true
  end

  def locales_dir
    Dir["#{LokaliseRailsMontells.locales_path}/**/*"]
  end

  def mkdir_locales
    FileUtils.mkdir_p(LokaliseRailsMontells.locales_path) unless File.directory?(LokaliseRailsMontells.locales_path)
  end

  def rm_translation_files
    FileUtils.rm_rf locales_dir
  end

  def count_translations
    locales_dir.count { |file| File.file?(file) }
  end

  def add_config
    data = <<~DATA
      require 'lokalise_rails_montells'
      
      LokaliseRailsMontells.config do |c|
        c.api_token = ENV['LOKALISE_API_TOKEN']
        c.project_id = ENV['LOKALISE_PROJECT_ID']
      end
    DATA
    File.open(config_file, 'w+:UTF-8') do |f|
      f.write data
    end
  end

  def config_file
    "#{Rails.root}/config/lokalise_rails_montells.rb"
  end

  def remove_config
    FileUtils.remove_file config_file if File.file? config_file
  end

  private

  def en_data
    <<-DATA
      en:
        my_key: "My value"
        nested:
          key: "Value 2"
    DATA
  end
end
