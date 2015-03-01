require 'calabash-cucumber/core'

# Stub for Calabash
module Calabash
  # Stub for Cucumber
  module Cucumber
    # Stub for Core
    module Core
      attr_accessor :ui_query
      attr_accessor :args
      attr_accessor :opts
      attr_accessor :direction
      attr_accessor :item
      attr_accessor :section
      attr_accessor :response

      def query(uiquery, *args)
        self.ui_query = uiquery
        self.args = args
        self.response = response
      end

      def flash(uiquery, *args)
        self.ui_query = uiquery
        self.args = args
      end

      def scroll(uiquery, direction)
        self.ui_query = uiquery
        self.direction = direction
      end

      def scroll_to_collection_view_item(item, section, opts = {})
        self.item = item
        self.section = section
        self.opts = opts
      end

      def touch(uiquery, opts = {})
        self.ui_query = uiquery
        self.opts = opts
      end

      def double_tap(uiquery, opts = {})
        self.ui_query = uiquery
        self.opts = opts
      end
    end
  end
end
