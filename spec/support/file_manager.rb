require 'fileutils'

module FileManager
  def config_file
    "#{Rails.root}/config/lokalise_rails_montells.rb"
  end

  def remove_config
    FileUtils.remove_file config_file if File.file? config_file
  end
end