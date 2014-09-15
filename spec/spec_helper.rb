require 'minitest/autorun'
require 'minitest/reporters'

require 'calios-uikit-extension'

require_relative 'stubs/calabash_cucumber_core_stub'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
