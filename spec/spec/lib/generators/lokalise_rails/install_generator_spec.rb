# frozen_string_literal: true

require 'generators/lokalise_rails_montells/install_generator'

RSpec.describe LokaliseRailsMontells::Generators::InstallGenerator do
  before :all do
    remove_config
  end

  after :all do
    remove_config
  end

  it 'install config file properly' do
    described_class.start
    expect(File.file?(config_file)).to be true
  end
end
