require_relative 'ui_base'

class UITableView < UIBase
  class << self
    def scroll(aDirection)
      Calabash::Cucumber::Core.scroll(self.class_name, aDirection)
    end
  end
end
