require 'calabash-cucumber/core'

module Calabash::Cucumber::Core
  def query(uiquery, *args)
    $uiquery = uiquery
    $args = args
    $stub_query_response
  end

  def flash(uiquery, *args)
    $uiquery = uiquery
    $args = args
  end

  def scroll(uiquery, direction)
    $uiquery = uiquery
    $direction = direction
  end

  def scroll_to_collection_view_item(item, section, opts={})
    $item = item
    $section = section
    $opts = opts
  end

  def touch(uiquery, opts={})
    $uiquery = uiquery
    $opts = opts
  end

  def double_tap(uiquery, opts={})
    $uiquery = uiquery
    $opts = opts
  end
end

class CalabashCucumberCoreStubClass
  include Calabash::Cucumber::Core
end
