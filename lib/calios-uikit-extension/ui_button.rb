require_relative 'ui_base'

#
# Provides methods for UIButton elements
#
class UIButton < UIBase
  class << self
    def text(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :currentTitle).first
    end

    def selected?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isSelected).first.to_boolean
    end
  end
end
