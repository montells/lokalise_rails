# frozen_string_literal: true

RSpec.describe LokaliseRailsMontells do
  it 'is possible to provide config options' do
    described_class.config do |c|
      expect(c).to eq(described_class)
    end
  end
end
