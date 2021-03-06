require_relative 'lib/calios-uikit-extension/version'

Gem::Specification.new do |gem|
  gem.name          = 'calios-uikit-extension'
  gem.version       = CaliosUIKitExtension::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Jani Jegoroff']
  gem.email         = ['jani.jegoroff@gmail.com']
  gem.summary       = 'Calabash-ios UIKit extension.'
  gem.description   = 'Calabash-ios UIKit extension provides convenient metaclasses for Calabash usage.'
  gem.homepage      = 'http://github.com/JaniJegoroff/calios-uikit-extension'
  gem.license       = 'MIT'

  gem.files         = Dir.glob('lib/**/*.rb')
  gem.require_paths = ['lib']

  gem.test_files    = Dir.glob('spec/**/*.rb')

  gem.add_runtime_dependency 'calabash-cucumber', '~> 0.9', '>= 0.9.169'
  gem.add_runtime_dependency 'to_boolean', '~> 1.0'

  gem.add_development_dependency 'rake', '~> 10.4'
  gem.add_development_dependency 'minitest', '~> 5.8'
  gem.add_development_dependency 'minitest-reporters', '~> 1.1'
  gem.add_development_dependency 'rubocop', '~> 0.35'
  gem.add_development_dependency 'coveralls', '~> 0.8'
end
