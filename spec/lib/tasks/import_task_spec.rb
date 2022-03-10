require 'spec_helper'

RSpec.describe :tasks do
  describe 'import' do
    it 'export take task is callable' do
      expect(export_executor).to output(/completed!/).to_stdout
    end
  end

  describe LokaliseRailsMontells do
    let(:locales_path) { described_class.locales_path }
    let(:remote_translations) { 'https://github.com/bodrovis/lokalise_rails/blob/master/spec/dummy/public/trans.zip?raw=true' }

    before do
      mkdir_locales
      rm_translation_files
    end

    after :all do
      rm_translation_files
    end

    it 'import rake task downloads ZIP archive properly' do
      allow(LokaliseRailsMontells::TaskDefinition::Importer).to receive(:download_files).
        and_return({
                     'project_id' => '123.abc',
                     'bundle_url' => remote_translations
                   })
      expect(import_executor).to output(/complete!/).to_stdout
      expect(LokaliseRailsMontells::TaskDefinition::Importer).to have_received(:download_files)
      expect(count_translations).to eq 4
      expect_file_exist locales_path, 'en/nested/main_en.yml'
      expect_file_exist locales_path, 'en/nested/deep/secondary_en.yml'
      expect_file_exist locales_path, 'ru/main_ru.yml'
    end
  end
end
