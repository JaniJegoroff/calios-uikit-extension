require_relative 'spec_helper'

class SpecUIKeyboardAutomatic < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIKeyboardAutomatic' do
    describe 'UIKeyboardAutomatic.class_name' do
      it 'should return class name' do
        UIKeyboardAutomatic.class_name.must_equal('UIKeyboardAutomatic')
      end
    end

    describe 'UIKeyboardAutomatic.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UIKeyboardAutomatic.touch
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")

        UIKeyboardAutomatic.touch(0)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} index:0")

        UIKeyboardAutomatic.touch('myId')
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} marked:'myId'")

        UIKeyboardAutomatic.tap
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")

        UIKeyboardAutomatic.tap(0)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} index:0")

        UIKeyboardAutomatic.tap('myId')
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} marked:'myId'")
      end
    end

    describe 'UIKeyboardAutomatic.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UIKeyboardAutomatic.double_tap
        $uiquery.must_equal(UIKeyboardAutomatic.class_name)

        UIKeyboardAutomatic.double_tap(0)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} index:0")

        UIKeyboardAutomatic.double_tap('myId')
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} marked:'myId'")
      end
    end

    describe 'UIKeyboardAutomatic.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIKeyboardAutomatic.property(:finland)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:finland)

        UIKeyboardAutomatic.prop(:finland)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:finland)

        UIKeyboardAutomatic.p(:finland)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UIKeyboardAutomatic.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIKeyboardAutomatic.accessibility_label
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UIKeyboardAutomatic.label
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UIKeyboardAutomatic.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIKeyboardAutomatic.accessibility_identifier
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UIKeyboardAutomatic.identifier
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UIKeyboardAutomatic.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UIKeyboardAutomatic.enabled?.must_equal(true)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name}")
        $args.first.must_equal(:isEnabled)

        UIKeyboardAutomatic.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UIKeyboardAutomatic.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UIKeyboardAutomatic.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end
