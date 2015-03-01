require_relative 'spec_helper'

# Test class for UIButton
class SpecUIButton < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UIButton' do
    describe 'UIButton.text' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(abc def ghi)

        UIButton.text.must_equal('abc')
        @core.ui_query.must_equal("#{UIButton.class_name}")
        @core.args.first.must_equal(:currentTitle)

        UIButton.text(0).must_equal('abc')
        @core.ui_query.must_equal("#{UIButton.class_name} index:0")
        @core.args.first.must_equal(:currentTitle)

        UIButton.text('myId').must_equal('abc')
        @core.ui_query.must_equal("#{UIButton.class_name} marked:'myId'")
        @core.args.first.must_equal(:currentTitle)
      end
    end

    describe 'UIButton.selected?' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [false, true]
        ret = UIButton.selected?
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UIButton.class_name}")
        @core.args.first.must_equal(:isSelected)

        @core.response = [false, true]
        ret = UIButton.selected?(0)
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UIButton.class_name} index:0")
        @core.args.first.must_equal(:isSelected)

        @core.response = [true, false]
        ret = UIButton.selected?('myId')
        ret.must_equal(true)
        @core.ui_query.must_equal("#{UIButton.class_name} marked:'myId'")
        @core.args.first.must_equal(:isSelected)
      end
    end
  end
end
