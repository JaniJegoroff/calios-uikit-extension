require_relative 'ui_base'

#
# Provides methods for UICollectionViewCell elements
#
class UICollectionViewCell < UIBase
  class << self
    def count
      Calabash::Cucumber::Core.query("#{class_name}").count
    end

    def selected?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isSelected).first.to_boolean
    end
  end
end
