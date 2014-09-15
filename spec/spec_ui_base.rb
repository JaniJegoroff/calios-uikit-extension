require_relative 'spec_helper'

class SpecUIBase < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIBase' do
    describe 'UIBase.raise_if_invalid' do
      it 'should raise' do
        proc { UIButton.text(:symbol) }.must_raise(RuntimeError)
        proc { UIButton.touch(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionView.empty?(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.selected?(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.touch(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.double_tap(:symbol) }.must_raise(RuntimeError)
        proc { UILabel.text(:symbol) }.must_raise(RuntimeError)
        proc { UILabel.touch(:symbol) }.must_raise(RuntimeError)
        proc { UISwitch.on?(:symbol) }.must_raise(RuntimeError)
        proc { UISwitch.touch(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.text(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.selected?(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.touch(:symbol) }.must_raise(RuntimeError)
        proc { UITextField.text(:symbol) }.must_raise(RuntimeError)
        proc { UITextField.touch(:symbol) }.must_raise(RuntimeError)
      end
    end

    describe 'UIBase.parse_query' do
      it 'should parse query' do
        UIButton.parse_query(nil).must_equal('UIButton')
        UIButton.parse_query(0).must_equal('UIButton index:0')
        UIButton.parse_query('myId').must_equal("UIButton marked:'myId'")

        UICollectionView.parse_query(nil).must_equal('UICollectionView')
        UICollectionView.parse_query(0).must_equal('UICollectionView index:0')
        UICollectionView.parse_query('myId').must_equal("UICollectionView marked:'myId'")

        UICollectionViewCell.parse_query(nil).must_equal('UICollectionViewCell')
        UICollectionViewCell.parse_query(0).must_equal('UICollectionViewCell index:0')
        UICollectionViewCell.parse_query('myId').must_equal("UICollectionViewCell marked:'myId'")

        UILabel.parse_query(nil).must_equal('UILabel')
        UILabel.parse_query(0).must_equal('UILabel index:0')
        UILabel.parse_query('myId').must_equal("UILabel marked:'myId'")

        UISwitch.parse_query(nil).must_equal('UISwitch')
        UISwitch.parse_query(0).must_equal('UISwitch index:0')
        UISwitch.parse_query('myId').must_equal("UISwitch marked:'myId'")

        UITableViewCell.parse_query(nil).must_equal('UITableViewCell')
        UITableViewCell.parse_query(0).must_equal('UITableViewCell index:0')
        UITableViewCell.parse_query('myId').must_equal("UITableViewCell marked:'myId'")

        UITextField.parse_query(nil).must_equal('UITextField')
        UITextField.parse_query(0).must_equal('UITextField index:0')
        UITextField.parse_query('myId').must_equal("UITextField marked:'myId'")
      end
    end
  end
end
