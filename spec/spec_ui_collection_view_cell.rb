require_relative 'spec_helper'

class SpecUICollectionViewCell < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UICollectionViewCell' do
    describe 'UICollectionViewCell.class_name' do
      it 'should return class name' do
        UICollectionViewCell.class_name.must_equal('UICollectionViewCell')
      end
    end

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

    describe 'UICollectionViewCell.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UICollectionViewCell.touch
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")

        UICollectionViewCell.touch(0)
        $uiquery.must_equal("#{UICollectionViewCell.class_name} index:0")

        UICollectionViewCell.touch('myId')
        $uiquery.must_equal("#{UICollectionViewCell.class_name} marked:'myId'")

        UICollectionViewCell.tap
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")

        UICollectionViewCell.tap(0)
        $uiquery.must_equal("#{UICollectionViewCell.class_name} index:0")

        UICollectionViewCell.tap('myId')
        $uiquery.must_equal("#{UICollectionViewCell.class_name} marked:'myId'")
      end
    end

    describe 'UICollectionViewCell.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UICollectionViewCell.double_tap
        $uiquery.must_equal(UICollectionViewCell.class_name)

        UICollectionViewCell.double_tap(0)
        $uiquery.must_equal("#{UICollectionViewCell.class_name} index:0")

        UICollectionViewCell.double_tap('myId')
        $uiquery.must_equal("#{UICollectionViewCell.class_name} marked:'myId'")
      end
    end

    describe 'UICollectionViewCell.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UICollectionViewCell.property(:varkaus)
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")
        $args.first.must_equal(:varkaus)

        UICollectionViewCell.prop(:varkaus)
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")
        $args.first.must_equal(:varkaus)

        UICollectionViewCell.p(:varkaus)
        $uiquery.must_equal("#{UICollectionViewCell.class_name}")
        $args.first.must_equal(:varkaus)
      end
    end
  end
end
