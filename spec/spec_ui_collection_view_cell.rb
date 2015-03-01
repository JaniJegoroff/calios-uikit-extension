require_relative 'spec_helper'

# Test class for UICollectionViewCell
class SpecUICollectionViewCell < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UICollectionViewCell' do
    describe 'UICollectionViewCell.selected?' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [false, true]
        ret = UICollectionViewCell.selected?
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UICollectionViewCell.class_name}")
        @core.args.first.must_equal(:isSelected)

        @core.response = [false, true]
        ret = UICollectionViewCell.selected?(0)
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UICollectionViewCell.class_name} index:0")
        @core.args.first.must_equal(:isSelected)

        @core.response = [true, false]
        ret = UICollectionViewCell.selected?('myId')
        ret.must_equal(true)
        @core.ui_query.must_equal("#{UICollectionViewCell.class_name} marked:'myId'")
        @core.args.first.must_equal(:isSelected)
      end
    end

    describe 'UICollectionViewCell.count' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(aaa bbb ccc)
        UICollectionViewCell.count.must_equal(3)

        @core.response = %w(aaa)
        UICollectionViewCell.count.must_equal(1)
      end
    end
  end
end
