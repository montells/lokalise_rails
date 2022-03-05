# frozen_string_literal: true

require 'rake'
require 'lokalise_rails_montells/task_definition/base'
require 'lokalise_rails_montells/task_definition/importer'
require 'lokalise_rails_montells/task_definition/exporter'
require "#{Rails.root}/config/lokalise_rails_montells"

namespace :lokalise_rails_montells do
  task :import do
    LokaliseRailsMontells::TaskDefinition::Importer.import!
  end

  task :export do
    LokaliseRailsMontells::TaskDefinition::Importer.export!
  end
end
