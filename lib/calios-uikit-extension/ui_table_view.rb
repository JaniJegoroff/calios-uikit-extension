require_relative 'ui_base'

#
# Provides methods for UITableView elements
#
class UITableView < UIBase
  class << self
    def scroll(aDirection)
      Calabash::Cucumber::Core.scroll(class_name, aDirection)
    end
  end
end
