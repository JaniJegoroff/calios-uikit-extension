require_relative 'spec_helper'

class SpecUISearchBar < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UISearchBar' do
    describe 'UISearchBar.class_name' do
      it 'should return class name' do
        UISearchBar.class_name.must_equal('UISearchBar')
      end
    end

    describe 'UISearchBar.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UISearchBar.text.must_equal('abc')
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:text)

        UISearchBar.text(0).must_equal('abc')
        $uiquery.must_equal("#{UISearchBar.class_name} index:0")
        $args.first.must_equal(:text)

        UISearchBar.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UISearchBar.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end

    describe 'UISearchBar.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        UISearchBar.touch
        $uiquery.must_equal("#{UISearchBar.class_name}")

        UISearchBar.touch(0)
        $uiquery.must_equal("#{UISearchBar.class_name} index:0")

        UISearchBar.touch('myId')
        $uiquery.must_equal("#{UISearchBar.class_name} marked:'myId'")

        UISearchBar.tap
        $uiquery.must_equal("#{UISearchBar.class_name}")

        UISearchBar.tap(0)
        $uiquery.must_equal("#{UISearchBar.class_name} index:0")

        UISearchBar.tap('myId')
        $uiquery.must_equal("#{UISearchBar.class_name} marked:'myId'")
      end
    end

    describe 'UISearchBar.double_tap' do
      it 'should call Calabash double_tap method with correct parameters' do
        UISearchBar.double_tap
        $uiquery.must_equal(UISearchBar.class_name)

        UISearchBar.double_tap(0)
        $uiquery.must_equal("#{UISearchBar.class_name} index:0")

        UISearchBar.double_tap('myId')
        $uiquery.must_equal("#{UISearchBar.class_name} marked:'myId'")
      end
    end

    describe 'UISearchBar.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISearchBar.property(:finland)
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:finland)

        UISearchBar.prop(:finland)
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:finland)

        UISearchBar.p(:finland)
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'UISearchBar.accessibility_label and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISearchBar.accessibility_label
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:accessibilityLabel)

        UISearchBar.label
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:accessibilityLabel)
      end
    end

    describe 'UISearchBar.accessibility_identifier and aliases' do
      it 'should call Calabash query method with correct parameters' do
        UISearchBar.accessibility_identifier
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)

        UISearchBar.identifier
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:accessibilityIdentifier)
      end
    end

    describe 'UISearchBar.enabled?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [true, false]

        UISearchBar.enabled?.must_equal(true)
        $uiquery.must_equal("#{UISearchBar.class_name}")
        $args.first.must_equal(:isEnabled)

        UISearchBar.enabled?(0).must_equal(true)
        $uiquery.must_equal("#{UISearchBar.class_name} index:0")
        $args.first.must_equal(:isEnabled)

        UISearchBar.enabled?('myId').must_equal(true)
        $uiquery.must_equal("#{UISearchBar.class_name} marked:'myId'")
        $args.first.must_equal(:isEnabled)
      end
    end
  end
end
