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
  end
end
