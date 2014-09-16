require_relative 'spec_helper'

class SpecUIView < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIView' do
    describe 'UIView.class_name' do
      it 'should return class name' do
        UIView.class_name.must_equal('UIView')
      end
    end

    describe 'UIView.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UIView.touch
        $uiquery.must_equal("#{UIView.class_name}")

        UIView.touch(0)
        $uiquery.must_equal("#{UIView.class_name} index:0")

        UIView.touch('myId')
        $uiquery.must_equal("#{UIView.class_name} marked:'myId'")

        UIView.tap
        $uiquery.must_equal("#{UIView.class_name}")

        UIView.tap(0)
        $uiquery.must_equal("#{UIView.class_name} index:0")

        UIView.tap('myId')
        $uiquery.must_equal("#{UIView.class_name} marked:'myId'")
      end
    end

    describe 'UIView.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UIView.double_tap
        $uiquery.must_equal(UIView.class_name)

        UIView.double_tap(0)
        $uiquery.must_equal("#{UIView.class_name} index:0")

        UIView.double_tap('myId')
        $uiquery.must_equal("#{UIView.class_name} marked:'myId'")
      end
    end

    describe 'UIView.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIView.property(:finland)
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:finland)

        UIView.prop(:finland)
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:finland)

        UIView.p(:finland)
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UIView.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIView.accessibility_label
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UIView.label
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UIView.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIView.accessibility_identifier
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UIView.identifier
        $uiquery.must_equal("#{UIView.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end
  end
end
