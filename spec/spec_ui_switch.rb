require_relative 'spec_helper'

class SpecUISwitch < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UISwitch' do
    describe 'UISwitch.class_name' do
      it 'should return class name' do
        UISwitch.class_name.must_equal('UISwitch')
      end
    end

    describe 'UISwitch.on?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = UISwitch.on?
        ret.must_equal(false)
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:isOn)

        $stub_query_response = [false, true]
        ret = UISwitch.on?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{UISwitch.class_name} index:0")
        $args.first.must_equal(:isOn)

        $stub_query_response = [true, false]
        ret = UISwitch.on?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{UISwitch.class_name} marked:'myId'")
        $args.first.must_equal(:isOn)
      end
    end

    describe 'UISwitch.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UISwitch.touch
        $uiquery.must_equal("#{UISwitch.class_name}")

        UISwitch.touch(0)
        $uiquery.must_equal("#{UISwitch.class_name} index:0")

        UISwitch.touch('myId')
        $uiquery.must_equal("#{UISwitch.class_name} marked:'myId'")

        UISwitch.tap
        $uiquery.must_equal("#{UISwitch.class_name}")

        UISwitch.tap(0)
        $uiquery.must_equal("#{UISwitch.class_name} index:0")

        UISwitch.tap('myId')
        $uiquery.must_equal("#{UISwitch.class_name} marked:'myId'")
      end
    end

    describe 'UISwitch.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UISwitch.double_tap
        $uiquery.must_equal(UISwitch.class_name)

        UISwitch.double_tap(0)
        $uiquery.must_equal("#{UISwitch.class_name} index:0")

        UISwitch.double_tap('myId')
        $uiquery.must_equal("#{UISwitch.class_name} marked:'myId'")
      end
    end

    describe 'UISwitch.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISwitch.property(:oulu)
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:oulu)

        UISwitch.prop(:oulu)
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:oulu)

        UISwitch.p(:oulu)
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:oulu)
      end
    end

    describe 'UISwitch.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISwitch.accessibility_label
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UISwitch.label
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UISwitch.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISwitch.accessibility_identifier
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UISwitch.identifier
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UISwitch.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UISwitch.enabled?.must_equal(true)
        $uiquery.must_equal("#{UISwitch.class_name}")
        $args.first.must_equal(:isEnabled)

        UISwitch.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UISwitch.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UISwitch.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UISwitch.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end
