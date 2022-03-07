require 'spec_helper'

RSpec.describe :tasks do
  describe 'import' do
    it 'import take task is callable' do
      expect(import_executor).to output(/completed!/).to_stdout
    end

    it 'export take task is callable' do
      expect(export_executor).to output(/completed!/).to_stdout
    end
  end
end