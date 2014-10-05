require_relative 'ui_base'

#
# Provides methods for UISwitch elements
#
class UISwitch < UIBase
  class << self
    def on?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isOn).first.to_boolean
    end
  end
end
