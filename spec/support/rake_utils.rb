# frozen_string_literal: true

module RakeUtils
  def import_executor
    -> { Rake::Task['lokalise_rails_montells:import'].execute }
  end

  def export_executor
    -> { Rake::Task['lokalise_rails_montells:export'].execute }
  end
end
