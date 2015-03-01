require_relative 'spec_helper'

# Test class for UITableView
class SpecUITableView < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UITableView' do
    describe 'UITableView.scroll' do
      it 'should call Calabash scroll method with correct parameters' do
        directions = [:up, :down, :left, :right]

        directions.each do |value|
          UITableView.scroll(value)
          @core.ui_query.must_equal(UITableView.class_name)
          @core.direction.must_equal(value)
        end
      end
    end
  end
end
