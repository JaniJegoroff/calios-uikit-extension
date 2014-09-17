require_relative 'spec_helper'

class SpecUISegmentedControl < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UISegmentedControl' do
    describe 'UISegmentedControl.class_name' do
      it 'should return class name' do
        UISegmentedControl.class_name.must_equal('UISegmentedControl')
      end
    end

    describe 'UISegmentedControl.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UISegmentedControl.touch
        $uiquery.must_equal("#{UISegmentedControl.class_name}")

        UISegmentedControl.touch(0)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")

        UISegmentedControl.touch('myId')
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")

        UISegmentedControl.tap
        $uiquery.must_equal("#{UISegmentedControl.class_name}")

        UISegmentedControl.tap(0)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")

        UISegmentedControl.tap('myId')
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
      end
    end

    describe 'UISegmentedControl.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UISegmentedControl.double_tap
        $uiquery.must_equal(UISegmentedControl.class_name)

        UISegmentedControl.double_tap(0)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")

        UISegmentedControl.double_tap('myId')
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
      end
    end

    describe 'UISegmentedControl.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISegmentedControl.property(:finland)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:finland)

        UISegmentedControl.prop(:finland)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:finland)

        UISegmentedControl.p(:finland)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UISegmentedControl.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISegmentedControl.accessibility_label
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UISegmentedControl.label
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UISegmentedControl.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISegmentedControl.accessibility_identifier
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UISegmentedControl.identifier
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UISegmentedControl.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UISegmentedControl.enabled?.must_equal(true)
        $uiquery.must_equal("#{UISegmentedControl.class_name}")
        $args.first.must_equal(:isEnabled)

        UISegmentedControl.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UISegmentedControl.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UISegmentedControl.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UISegmentedControl.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end

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
