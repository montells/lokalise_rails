module LokaliseRailsMontells
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/lokalise_rails_montells_tasks.rake'
    end
  end
end