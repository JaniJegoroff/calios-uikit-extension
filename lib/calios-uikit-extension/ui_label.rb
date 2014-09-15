require_relative 'ui_base'

class UILabel < UIBase
  class << self
    def text(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :text).first
    end
  end
end
