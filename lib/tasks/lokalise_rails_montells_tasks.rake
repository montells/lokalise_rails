# frozen_string_literal: true

require 'rake'
require "#{Rails.root}/config/lokalise_rails_montells"

namespace :lokalise_rails_montells do
  task :import do
    LokaliseRailsMontells::TaskDefinition::Importer.import!
  end

  task :export do
    LokaliseRailsMontells::TaskDefinition::Importer.export!
  end
end
