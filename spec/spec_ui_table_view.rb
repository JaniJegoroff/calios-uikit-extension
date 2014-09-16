require_relative 'spec_helper'

class SpecUITableView < Minitest::Spec
  before do
    $uiquery = nil
    $direction = nil
  end

  after do
    # nop
  end

  describe 'UITableView' do
    describe 'UITableView.class_name' do
      it 'should return class name' do
        UITableView.class_name.must_equal('UITableView')
      end
    end

    describe 'UITableView.scroll' do
      it 'should call Calabash scroll method with correct parameters' do
        directions = [:up, :down, :left, :right]

        directions.each do |value|
          UITableView.scroll(value)
          $uiquery.must_equal(UITableView.class_name)
          $direction.must_equal(value)
        end
      end
    end

    describe 'UITableView.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UITableView.touch
        $uiquery.must_equal("#{UITableView.class_name}")

        UITableView.touch(0)
        $uiquery.must_equal("#{UITableView.class_name} index:0")

        UITableView.touch('myId')
        $uiquery.must_equal("#{UITableView.class_name} marked:'myId'")

        UITableView.tap
        $uiquery.must_equal("#{UITableView.class_name}")

        UITableView.tap(0)
        $uiquery.must_equal("#{UITableView.class_name} index:0")

        UITableView.tap('myId')
        $uiquery.must_equal("#{UITableView.class_name} marked:'myId'")
      end
    end

    describe 'UITableView.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UITableView.double_tap
        $uiquery.must_equal(UITableView.class_name)

        UITableView.double_tap(0)
        $uiquery.must_equal("#{UITableView.class_name} index:0")

        UITableView.double_tap('myId')
        $uiquery.must_equal("#{UITableView.class_name} marked:'myId'")
      end
    end

    describe 'UITableView.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITableView.property(:salmiakki)
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:salmiakki)

        UITableView.prop(:salmiakki)
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:salmiakki)

        UITableView.p(:salmiakki)
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:salmiakki)
      end
    end

    describe 'UITableView.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITableView.accessibility_label
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UITableView.label
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UITableView.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITableView.accessibility_identifier
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UITableView.identifier
        $uiquery.must_equal("#{UITableView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end
  end
end
