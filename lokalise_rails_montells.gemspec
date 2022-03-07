# frozen_string_literal: true

require_relative 'lib/lokalise_rails_montells/version'

Gem::Specification.new do |spec|
  spec.name          = 'lokalise_rails_montells'
  spec.version       = LokaliseRailsMontells::VERSION
  spec.authors       = ['Michel Sánchez Montells']
  spec.email         = ['montells@gmail.com']

  spec.summary       = 'Just following the build gem tutorial'
  spec.description   = 'Just following the build gem tutorial'
  spec.homepage      = 'https://github.com/montells/lokalise_rails'
  spec.license       = 'MIT'
  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.extra_rdoc_files = ['README.md']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-lokalise-api', '~> 3.1'
  spec.add_dependency 'rubyzip', '~> 2.3'

  spec.add_development_dependency 'codecov', '~> 0.1'
  spec.add_development_dependency 'dotenv', '~> 2.5'
  if ENV['TEST_RAILS_VERSION'].nil?
    spec.add_development_dependency 'rails', '~> 6.0.3'
  else
    spec.add_development_dependency 'rails', ENV['TEST_RAILS_VERSION'].to_s
  end
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rspec-rails', '~> 4.0'
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.37'
  spec.add_development_dependency 'simplecov', '~> 0.16'
  spec.add_development_dependency 'vcr', '~> 6.0'
end
