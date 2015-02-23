# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UITableView
class SpecUITableView < Minitest::Spec
  before do
    $uiquery = nil
    $direction = nil
  end

  after do
    # nop
  end

  describe 'UITableView' do
    describe 'UITableView.scroll' do
      it 'should call Calabash scroll method with correct parameters' do
        directions = [:up, :down, :left, :right]

        directions.each do |value|
          UITableView.scroll(value)
          $uiquery.must_equal(UITableView.class_name)
          $direction.must_equal(value)
        end
      end
    end
  end
end
