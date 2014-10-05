require_relative 'ui_base'

#
# Provides methods for UITableViewCell elements
#
class UITableViewCell < UIBase
  class << self
    def count
      Calabash::Cucumber::Core.query("#{class_name}").count
    end

    def text(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :text).first
    end

    def selected?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isSelected).first.to_boolean
    end
  end
end
