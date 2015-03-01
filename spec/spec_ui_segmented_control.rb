require_relative 'spec_helper'

# Test class for UISegmentedControl
class SpecUISegmentedControl < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UISegmentedControl' do
    describe 'UISegmentedControl.number_of_segments' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [4, 6]
        UISegmentedControl.number_of_segments.must_equal(4)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name}")
        @core.args.first.must_equal(:numberOfSegments)

        @core.response = [5]
        UISegmentedControl.number_of_segments(0).must_equal(5)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name} index:0")
        @core.args.first.must_equal(:numberOfSegments)

        @core.response = [10, 6, 7]
        UISegmentedControl.number_of_segments('myId').must_equal(10)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
        @core.args.first.must_equal(:numberOfSegments)
      end
    end

    describe 'UISegmentedControl.selected_segment_index' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [4, 6]
        UISegmentedControl.selected_segment_index.must_equal(4)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name}")
        @core.args.first.must_equal(:selectedSegmentIndex)

        @core.response = [5]
        UISegmentedControl.selected_segment_index(0).must_equal(5)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name} index:0")
        @core.args.first.must_equal(:selectedSegmentIndex)

        @core.response = [10, 6, 7]
        UISegmentedControl.selected_segment_index('myId').must_equal(10)
        @core.ui_query.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
        @core.args.first.must_equal(:selectedSegmentIndex)
      end
    end
  end
end
