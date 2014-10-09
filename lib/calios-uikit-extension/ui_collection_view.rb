# rubocop:disable Style/SpaceAfterColon
# rubocop:disable Style/BracesAroundHashParameters

require_relative 'ui_base'

#
# Provides methods for UICollectionView elements
#
class UICollectionView < UIBase
  class << self
    def number_of_items_in_section(aSection = 0)
      Calabash::Cucumber::Core.query("#{class_name}", numberOfItemsInSection:aSection).first
    end

    def scroll_to_item(aItem, aSection, aScrollPosition)
      scroll_to_collection_view_item(aItem, aSection, { scroll_position: aScrollPosition })
    end

    def scroll(aDirection)
      Calabash::Cucumber::Core.scroll(class_name, aDirection)
    end

    def empty?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q).empty?
    end
  end
end
