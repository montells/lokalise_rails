# frozen_string_literal: true

require 'rspec'

describe LokaliseRailsMontells::TaskDefinition::Exporter do
  let(:filename) { 'en.yml' }
  let(:path) { "#{Rails.root}/config/locales/nested/#{filename}" }
  let(:relative_name) { "nested/#{filename}" }

  before :all do
    add_translation_files!
  end

  after :all do
    rm_translation_files
  end

  it 'send a proper API request' do
    allow(LokaliseRailsMontells).to receive(:project_id).and_return('PROJECT_ID')

    process = VCR.use_cassette('upload_files') do
      described_class.export!
    end.first

    expect(process.project_id).to eq(LokaliseRailsMontells.project_id)
    expect(process.status).to eq 'queued'
  end
end
