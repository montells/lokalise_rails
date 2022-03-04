require 'rails/generators'

module LokaliseRailsMontells
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Creates a LokaliseRailsMontells configuration file'

      def copy_config
        template 'lokalise_rails_montells_config.rb', "#{Rails.root}/config/lokalise_rails_montells.rb"
      end
    end
  end
end