require_relative 'spec_helper'

class SpecUICollectionView < Minitest::Spec
  before do
    $uiquery = nil
    $direction = nil
    $item = nil
    $section = nil
    $args = nil
    $opts = {}
  end

  after do
    # nop
  end

  describe 'UICollectionView' do
    describe 'UICollectionView.class_name' do
      it 'should return class name' do
        UICollectionView.class_name.must_equal('UICollectionView')
      end
    end

    describe 'UICollectionView.number_of_items_in_section' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [10, 20, 30]

        UICollectionView.number_of_items_in_section.must_equal(10)
        $uiquery.must_equal(UICollectionView.class_name)
        $args.first.must_equal({:numberOfItemsInSection=>0})

        UICollectionView.number_of_items_in_section(0).must_equal(10)
        $uiquery.must_equal(UICollectionView.class_name)
        $args.first.must_equal({:numberOfItemsInSection=>0})

        UICollectionView.number_of_items_in_section(1).must_equal(10)
        $uiquery.must_equal(UICollectionView.class_name)
        $args.first.must_equal({:numberOfItemsInSection=>1})
      end
    end

    describe 'UICollectionView.scroll_to_item' do
      it 'should call Calabash scroll_to_collection_view_item method with correct parameters' do
        key = :scroll_position
        params = [[0, 0, :top], [1, 1, :bottom], [0, 1, :center]]

        params.each do |(item, section, direction)|
          UICollectionView.scroll_to_item(item, section, direction)
          $item.must_equal(item)
          $section.must_equal(section)
          $opts.has_key?(key).must_equal(true)
          $opts[key].must_equal(direction)
        end
      end
    end

    describe 'UICollectionView.scroll' do
      it 'should call Calabash scroll method with correct parameters' do
        directions = [:up, :down, :left, :right]

        directions.each do |value|
          UICollectionView.scroll(value)
          $uiquery.must_equal(UICollectionView.class_name)
          $direction.must_equal(value)
        end
      end
    end

    describe 'UICollectionView.empty?' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionView.empty?.must_equal(false)
        $uiquery.must_equal("#{UICollectionView.class_name}")

        UICollectionView.empty?(0).must_equal(false)
        $uiquery.must_equal("#{UICollectionView.class_name} index:0")

        UICollectionView.empty?('myId').must_equal(false)
        $uiquery.must_equal("#{UICollectionView.class_name} marked:'myId'")
      end
    end

    describe 'UICollectionView.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UICollectionView.touch
        $uiquery.must_equal("#{UICollectionView.class_name}")

        UICollectionView.touch(0)
        $uiquery.must_equal("#{UICollectionView.class_name} index:0")

        UICollectionView.touch('myId')
        $uiquery.must_equal("#{UICollectionView.class_name} marked:'myId'")

        UICollectionView.tap
        $uiquery.must_equal("#{UICollectionView.class_name}")

        UICollectionView.tap(0)
        $uiquery.must_equal("#{UICollectionView.class_name} index:0")

        UICollectionView.tap('myId')
        $uiquery.must_equal("#{UICollectionView.class_name} marked:'myId'")
      end
    end

    describe 'UICollectionView.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UICollectionView.double_tap
        $uiquery.must_equal(UICollectionView.class_name)

        UICollectionView.double_tap(0)
        $uiquery.must_equal("#{UICollectionView.class_name} index:0")

        UICollectionView.double_tap('myId')
        $uiquery.must_equal("#{UICollectionView.class_name} marked:'myId'")
      end
    end

    describe 'UICollectionView.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionView.property(:myParam)
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:myParam)

        UICollectionView.prop(:myParam)
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:myParam)

        UICollectionView.p(:myParam)
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:myParam)
      end
    end

    describe 'UICollectionView.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionView.accessibility_label
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UICollectionView.label
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UICollectionView.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionView.accessibility_identifier
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UICollectionView.identifier
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UICollectionView.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UICollectionView.enabled?.must_equal(true)
        $uiquery.must_equal("#{UICollectionView.class_name}")
        $args.first.must_equal(:isEnabled)

        UICollectionView.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UICollectionView.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UICollectionView.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UICollectionView.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end