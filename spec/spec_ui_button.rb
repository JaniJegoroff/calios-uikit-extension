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
    describe 'UIButton.class_name' do
      it 'should return class name' do
        UIButton.class_name.must_equal('UIButton')
      end
    end

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

    describe 'UIButton.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UIButton.touch
        $uiquery.must_equal("#{UIButton.class_name}")

        UIButton.touch(0)
        $uiquery.must_equal("#{UIButton.class_name} index:0")

        UIButton.touch('myId')
        $uiquery.must_equal("#{UIButton.class_name} marked:'myId'")

        UIButton.tap
        $uiquery.must_equal("#{UIButton.class_name}")

        UIButton.tap(0)
        $uiquery.must_equal("#{UIButton.class_name} index:0")

        UIButton.tap('myId')
        $uiquery.must_equal("#{UIButton.class_name} marked:'myId'")
      end
    end

    describe 'UIButton.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UIButton.double_tap
        $uiquery.must_equal(UIButton.class_name)

        UIButton.double_tap(0)
        $uiquery.must_equal("#{UIButton.class_name} index:0")

        UIButton.double_tap('myId')
        $uiquery.must_equal("#{UIButton.class_name} marked:'myId'")
      end
    end

    describe 'UIButton.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIButton.property(:finland)
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:finland)

        UIButton.prop(:finland)
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:finland)

        UIButton.p(:finland)
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UIButton.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIButton.accessibility_label
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UIButton.label
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UIButton.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UIButton.accessibility_identifier
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UIButton.identifier
        $uiquery.must_equal("#{UIButton.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end
  end
end
