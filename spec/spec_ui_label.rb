require_relative 'spec_helper'

class SpecUILabel < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UILabel' do
    describe 'UILabel.class_name' do
      it 'should return class name' do
        UILabel.class_name.must_equal('UILabel')
      end
    end

    describe 'UILabel.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UILabel.text.must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:text)

        UILabel.text(0).must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name} index:0")
        $args.first.must_equal(:text)

        UILabel.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end

    describe 'UILabel.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UILabel.touch
        $uiquery.must_equal("#{UILabel.class_name}")

        UILabel.touch(0)
        $uiquery.must_equal("#{UILabel.class_name} index:0")

        UILabel.touch('myId')
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")

        UILabel.tap
        $uiquery.must_equal("#{UILabel.class_name}")

        UILabel.tap(0)
        $uiquery.must_equal("#{UILabel.class_name} index:0")

        UILabel.tap('myId')
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")
      end
    end

    describe 'UILabel.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UILabel.double_tap
        $uiquery.must_equal(UILabel.class_name)

        UILabel.double_tap(0)
        $uiquery.must_equal("#{UILabel.class_name} index:0")

        UILabel.double_tap('myId')
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")
      end
    end

    describe 'UILabel.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UILabel.property(:kuopio)
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:kuopio)

        UILabel.prop(:kuopio)
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:kuopio)

        UILabel.p(:kuopio)
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:kuopio)
      end
    end

    describe 'UILabel.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UILabel.accessibility_label
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UILabel.label
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UILabel.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UILabel.accessibility_identifier
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UILabel.identifier
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UILabel.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UILabel.enabled?.must_equal(true)
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:isEnabled)

        UILabel.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UILabel.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UILabel.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end
