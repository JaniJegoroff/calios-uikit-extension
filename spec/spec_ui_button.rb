require_relative 'spec_helper'

class SpecUIButton < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIButton' do
    describe 'UIButton.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UIButton.text.must_equal('abc')
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:currentTitle)

        UIButton.text(0).must_equal('abc')
        $uiquery.must_equal("#{UIButton.class_name} index:0")
        $args.first.must_equal(:currentTitle)

        UIButton.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UIButton.class_name} marked:'myId'")
        $args.first.must_equal(:currentTitle)
      end
    end

    describe 'UIButton.selected?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = UIButton.selected?
        ret.must_equal(false)
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [false, true]
        ret = UIButton.selected?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{UIButton.class_name} index:0")
        $args.first.must_equal(:isSelected)

        $stub_query_response = [true, false]
        ret = UIButton.selected?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{UIButton.class_name} marked:'myId'")
        $args.first.must_equal(:isSelected)
      end
    end
  end
end
