# frozen_string_literal: true

require 'fileutils'

module FileManager
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
end
