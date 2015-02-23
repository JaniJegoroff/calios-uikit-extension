# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UITableViewCell
class SpecUITableViewCell < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UITableViewCell' do
    describe 'UITableViewCell.selected?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = UITableViewCell.selected?
        ret.must_equal(false)
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [false, true]
        ret = UITableViewCell.selected?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{UITableViewCell.class_name} index:0")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [true, false]
        ret = UITableViewCell.selected?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{UITableViewCell.class_name} marked:'myId'")
        $args.first.must_equal(:isSelected)
      end
    end

    describe 'UITableViewCell.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UITableViewCell.text.must_equal('abc')
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:text)

        UITableViewCell.text(0).must_equal('abc')
        $uiquery.must_equal("#{UITableViewCell.class_name} index:0")
        $args.first.must_equal(:text)

        UITableViewCell.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UITableViewCell.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end
  end
end
