require_relative 'spec_helper'

class SpecUITextField < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UITextField' do
    describe 'UITextField.class_name' do
      it 'should return class name' do
        UITextField.class_name.must_equal('UITextField')
      end
    end

    describe 'UITextField.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UITextField.text.must_equal('abc')
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:text)

        UITextField.text(0).must_equal('abc')
        $uiquery.must_equal("#{UITextField.class_name} index:0")
        $args.first.must_equal(:text)

        UITextField.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UITextField.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end

    describe 'UITextField.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UITextField.touch
        $uiquery.must_equal("#{UITextField.class_name}")

        UITextField.touch(0)
        $uiquery.must_equal("#{UITextField.class_name} index:0")

        UITextField.touch('myId')
        $uiquery.must_equal("#{UITextField.class_name} marked:'myId'")

        UITextField.tap
        $uiquery.must_equal("#{UITextField.class_name}")

        UITextField.tap(0)
        $uiquery.must_equal("#{UITextField.class_name} index:0")

        UITextField.tap('myId')
        $uiquery.must_equal("#{UITextField.class_name} marked:'myId'")
      end
    end

    describe 'UITextField.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UITextField.double_tap
        $uiquery.must_equal(UITextField.class_name)

        UITextField.double_tap(0)
        $uiquery.must_equal("#{UITextField.class_name} index:0")

        UITextField.double_tap('myId')
        $uiquery.must_equal("#{UITextField.class_name} marked:'myId'")
      end
    end

    describe 'UITextField.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITextField.property(:saimi)
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:saimi)

        UITextField.prop(:saimi)
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:saimi)

        UITextField.p(:saimi)
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:saimi)
      end
    end

    describe 'UITextField.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITextField.accessibility_label
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UITextField.label
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UITextField.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UITextField.accessibility_identifier
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UITextField.identifier
        $uiquery.must_equal("#{UITextField.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end
  end
end
