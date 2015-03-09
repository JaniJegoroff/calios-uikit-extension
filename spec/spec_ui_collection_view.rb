# rubocop:disable Style/BracesAroundHashParameters
# rubocop:disable Style/SpaceInsideHashLiteralBraces
# rubocop:disable Style/HashSyntax
# rubocop:disable Style/SpaceAroundOperators

require_relative 'spec_helper'

# Test class for UICollectionView
class SpecUICollectionView < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UICollectionView' do
    describe 'UICollectionView.number_of_items_in_section' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [10, 20, 30]

        UICollectionView.number_of_items_in_section.must_equal(10)
        @core.ui_query.must_equal(UICollectionView.class_name)
        @core.args.first.must_equal({:numberOfItemsInSection=>0})

        UICollectionView.number_of_items_in_section(0).must_equal(10)
        @core.ui_query.must_equal(UICollectionView.class_name)
        @core.args.first.must_equal({:numberOfItemsInSection=>0})

        UICollectionView.number_of_items_in_section(1).must_equal(10)
        @core.ui_query.must_equal(UICollectionView.class_name)
        @core.args.first.must_equal({:numberOfItemsInSection=>1})
      end
    end

    describe 'UICollectionView.scroll_to_item' do
      it 'should call Calabash scroll_to_collection_view_item method with correct parameters' do
        key = :scroll_position
        params = [[0, 0, :top], [1, 1, :bottom], [0, 1, :center]]

        params.each do |(item, section, direction)|
          UICollectionView.scroll_to_item(item, section, direction)
          UICollectionView.item.must_equal(item)
          UICollectionView.section.must_equal(section)
          UICollectionView.opts.key?(key).must_equal(true)
          UICollectionView.opts[key].must_equal(direction)
        end
      end
    end

    describe 'UICollectionView.scroll' do
      it 'should call Calabash scroll method with correct parameters' do
        directions = [:up, :down, :left, :right]

        directions.each do |value|
          UICollectionView.scroll(value)
          @core.ui_query.must_equal(UICollectionView.class_name)
          @core.direction.must_equal(value)
        end
      end
    end

    describe 'UICollectionView.empty?' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionView.empty?.must_equal(false)
        @core.ui_query.must_equal("#{UICollectionView.class_name}")

        UICollectionView.empty?(0).must_equal(false)
        @core.ui_query.must_equal("#{UICollectionView.class_name} index:0")

        UICollectionView.empty?('myId').must_equal(false)
        @core.ui_query.must_equal("#{UICollectionView.class_name} marked:'myId'")
      end
    end
  end
end
