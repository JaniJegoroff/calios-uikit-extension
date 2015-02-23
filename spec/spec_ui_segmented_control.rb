# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UISegmentedControl
class SpecUISegmentedControl < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UISegmentedControl' do
    describe 'UISegmentedControl.number_of_segments' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [4, 6]
        UISegmentedControl.number_of_segments.must_equal(4)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:numberOfSegments)

        $stub_query_response = [5]
        UISegmentedControl.number_of_segments(0).must_equal(5)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")
        $args.first.must_equal(:numberOfSegments)

        $stub_query_response = [10, 6, 7]
        UISegmentedControl.number_of_segments('myId').must_equal(10)
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
        $args.first.must_equal(:numberOfSegments)
      end
    end

    describe 'UISegmentedControl.selected_segment_index' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [4, 6]
        UISegmentedControl.selected_segment_index.must_equal(4)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:selectedSegmentIndex)

        $stub_query_response = [5]
        UISegmentedControl.selected_segment_index(0).must_equal(5)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")
        $args.first.must_equal(:selectedSegmentIndex)

        $stub_query_response = [10, 6, 7]
        UISegmentedControl.selected_segment_index('myId').must_equal(10)
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
        $args.first.must_equal(:selectedSegmentIndex)
      end
    end
  end
end
