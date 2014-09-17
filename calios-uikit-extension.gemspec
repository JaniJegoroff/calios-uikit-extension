Gem::Specification.new do |gem|
  gem.name          = 'calios-uikit-extension'
  gem.version       = '0.0.5'
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

  gem.add_runtime_dependency 'calabash-cucumber', '>= 0.9.169'
  gem.add_runtime_dependency 'to_boolean', '~> 1.0'

  gem.add_development_dependency 'rake', '~> 10.3'
  gem.add_development_dependency 'minitest', '~> 5.4'
  gem.add_development_dependency 'minitest-reporters', '~> 1.0'
end
