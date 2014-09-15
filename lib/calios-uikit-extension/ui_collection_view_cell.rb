require_relative 'ui_base'

class UICollectionViewCell < UIBase
  class << self
    def count
      Calabash::Cucumber::Core.query("#{self.class_name}").count
    end

    def selected?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isSelected).first.to_boolean
    end
  end
end
