# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UICollectionViewCell
class SpecUICollectionViewCell < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UICollectionViewCell' do
    describe 'UICollectionViewCell.selected?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = UICollectionViewCell.selected?
        ret.must_equal(false)
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [false, true]
        ret = UICollectionViewCell.selected?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{UICollectionViewCell.class_name} index:0")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [true, false]
        ret = UICollectionViewCell.selected?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{UICollectionViewCell.class_name} marked:'myId'")
        $args.first.must_equal(:isSelected)
      end
    end

    describe 'UICollectionViewCell.count' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(aaa bbb ccc)
        UICollectionViewCell.count.must_equal(3)

        $stub_query_response = %w(aaa)
        UICollectionViewCell.count.must_equal(1)
      end
    end
  end
end
