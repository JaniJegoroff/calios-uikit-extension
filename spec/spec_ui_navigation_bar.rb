require_relative 'spec_helper'

class SpecUINavigationBar < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UINavigationBar' do
    describe 'UINavigationBar.class_name' do
      it 'should return class name' do
        UINavigationBar.class_name.must_equal('UINavigationBar')
      end
    end

    describe 'UINavigationBar.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UINavigationBar.touch
        $uiquery.must_equal("#{UINavigationBar.class_name}")

        UINavigationBar.touch(0)
        $uiquery.must_equal("#{UINavigationBar.class_name} index:0")

        UINavigationBar.touch('myId')
        $uiquery.must_equal("#{UINavigationBar.class_name} marked:'myId'")

        UINavigationBar.tap
        $uiquery.must_equal("#{UINavigationBar.class_name}")

        UINavigationBar.tap(0)
        $uiquery.must_equal("#{UINavigationBar.class_name} index:0")

        UINavigationBar.tap('myId')
        $uiquery.must_equal("#{UINavigationBar.class_name} marked:'myId'")
      end
    end

    describe 'UINavigationBar.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UINavigationBar.double_tap
        $uiquery.must_equal(UINavigationBar.class_name)

        UINavigationBar.double_tap(0)
        $uiquery.must_equal("#{UINavigationBar.class_name} index:0")

        UINavigationBar.double_tap('myId')
        $uiquery.must_equal("#{UINavigationBar.class_name} marked:'myId'")
      end
    end

    describe 'UINavigationBar.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UINavigationBar.property(:finland)
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:finland)

        UINavigationBar.prop(:finland)
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:finland)

        UINavigationBar.p(:finland)
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UINavigationBar.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UINavigationBar.accessibility_label
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UINavigationBar.label
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UINavigationBar.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UINavigationBar.accessibility_identifier
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UINavigationBar.identifier
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UINavigationBar.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UINavigationBar.enabled?.must_equal(true)
        $uiquery.must_equal("#{UINavigationBar.class_name}")
        $args.first.must_equal(:isEnabled)

        UINavigationBar.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UINavigationBar.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UINavigationBar.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UINavigationBar.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end
