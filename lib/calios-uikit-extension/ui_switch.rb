require_relative 'ui_base'

class UISwitch < UIBase
  class << self
    def on?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isOn).first.to_boolean
    end
  end
end
