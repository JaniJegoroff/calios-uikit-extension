require_relative 'spec_helper'

class SpecUIView < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIView' do
    # Nothing here yet
  end
end
