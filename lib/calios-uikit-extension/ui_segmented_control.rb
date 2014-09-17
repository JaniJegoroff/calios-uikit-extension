require_relative 'ui_base'

class UISegmentedControl < UIBase
  class << self
    def number_of_segments(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :numberOfSegments).first
    end

    def selected_segment_index(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :selectedSegmentIndex).first
    end
  end
end
