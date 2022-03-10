# frozen_string_literal: true

describe LokaliseRailsMontells::TaskDefinition::Importer do
  it 'returns a proper download URL' do
    project_id = 'PROJECT_ID'
    allow(LokaliseRailsMontells).to receive(:project_id).and_return(project_id)

    response = VCR.use_cassette('download_files') do
      described_class.download_files
    end

    expect(LokaliseRailsMontells).to have_received(:project_id)
    expect(response['project_id']).to eq(project_id)
    expect(response['bundle_url']).to include('s3-eu-west-1.amazonaws.com')
  end
end
