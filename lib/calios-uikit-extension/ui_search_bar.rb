require_relative 'ui_base'

#
# Provides methods for UISearchBar elements
#
class UISearchBar < UIBase
  class << self
    def text(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :text).first
    end
  end
end
