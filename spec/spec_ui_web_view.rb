require_relative 'spec_helper'

class SpecUIWebView < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIWebView' do
    # Nothing here yet
  end
end
