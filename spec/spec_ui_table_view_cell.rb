require_relative 'spec_helper'

# Test class for UITableViewCell
class SpecUITableViewCell < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UITableViewCell' do
    describe 'UITableViewCell.selected?' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [false, true]
        ret = UITableViewCell.selected?
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UITableViewCell.class_name}")
        @core.args.first.must_equal(:isSelected)

        @core.response = [false, true]
        ret = UITableViewCell.selected?(0)
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UITableViewCell.class_name} index:0")
        @core.args.first.must_equal(:isSelected)

        @core.response = [true, false]
        ret = UITableViewCell.selected?('myId')
        ret.must_equal(true)
        @core.ui_query.must_equal("#{UITableViewCell.class_name} marked:'myId'")
        @core.args.first.must_equal(:isSelected)
      end
    end

    describe 'UITableViewCell.text' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(abc def ghi)

        UITableViewCell.text.must_equal('abc')
        @core.ui_query.must_equal("#{UITableViewCell.class_name}")
        @core.args.first.must_equal(:text)

        UITableViewCell.text(0).must_equal('abc')
        @core.ui_query.must_equal("#{UITableViewCell.class_name} index:0")
        @core.args.first.must_equal(:text)

        UITableViewCell.text('myId').must_equal('abc')
        @core.ui_query.must_equal("#{UITableViewCell.class_name} marked:'myId'")
        @core.args.first.must_equal(:text)
      end
    end

    describe 'UITableViewCell.count' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(aaa bbb ccc)
        UITableViewCell.count.must_equal(3)

        @core.response = %w(aaa)
        UITableViewCell.count.must_equal(1)
      end
    end
  end
end
