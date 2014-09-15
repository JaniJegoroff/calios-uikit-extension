require_relative 'ui_base'

class UIButton < UIBase
  class << self
    def text(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :currentTitle).first
    end

    alias_method :tap, :touch
  end
end
