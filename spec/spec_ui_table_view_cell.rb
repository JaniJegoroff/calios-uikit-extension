require_relative 'spec_helper'

class SpecUITableViewCell < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UITableViewCell' do
    describe 'UITableViewCell.class_name' do
      it 'should return class name' do
        UITableViewCell.class_name.must_equal('UITableViewCell')
      end
    end

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

    describe 'UITableViewCell.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UITableViewCell.touch
        $uiquery.must_equal("#{UITableViewCell.class_name}")

        UITableViewCell.touch(0)
        $uiquery.must_equal("#{UITableViewCell.class_name} index:0")

        UITableViewCell.touch('myId')
        $uiquery.must_equal("#{UITableViewCell.class_name} marked:'myId'")

        UITableViewCell.tap
        $uiquery.must_equal("#{UITableViewCell.class_name}")

        UITableViewCell.tap(0)
        $uiquery.must_equal("#{UITableViewCell.class_name} index:0")

        UITableViewCell.tap('myId')
        $uiquery.must_equal("#{UITableViewCell.class_name} marked:'myId'")
      end
    end

    describe 'UITableViewCell.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UITableViewCell.double_tap
        $uiquery.must_equal(UITableViewCell.class_name)

        UITableViewCell.double_tap(0)
        $uiquery.must_equal("#{UITableViewCell.class_name} index:0")

        UITableViewCell.double_tap('myId')
        $uiquery.must_equal("#{UITableViewCell.class_name} marked:'myId'")
      end
    end

    describe 'UITableViewCell.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITableViewCell.accessibility_label
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UITableViewCell.label
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UITableViewCell.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITableViewCell.accessibility_identifier
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UITableViewCell.identifier
        $uiquery.must_equal("#{UITableViewCell.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end
  end
end
