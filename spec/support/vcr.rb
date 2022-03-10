# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.ignore_host 'codeclimate.com'
  config.hook_into :faraday
  config.cassette_library_dir = File.join(File.dirname(__FILE__ ), '..', 'fixtures', 'vcr_cassettes')
  config.filter_sensitive_data('<LOKALISE_TOKEN') { ENV['LOKALISE_API_TOKEN'] }
  config.configure_rspec_metadata!
end
