require_relative 'ui_base'

class UICollectionView < UIBase
  class << self
    def number_of_items_in_section(aSection=0)
      Calabash::Cucumber::Core.query("#{self.class_name}", numberOfItemsInSection:aSection).first
    end

    def scroll_to_item(aItem, aSection, aScrollPosition)
      scroll_to_collection_view_item(aItem, aSection, {scroll_position: aScrollPosition})
    end

    def scroll(aDirection)
      Calabash::Cucumber::Core.scroll(self.class_name, aDirection)
    end

    def empty?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q).empty?
    end
  end
end
