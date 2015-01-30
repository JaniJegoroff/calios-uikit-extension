require_relative 'spec_helper'

class SpecUIBase < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UIBase' do
    classes = [UIButton, UICollectionView, UICollectionViewCell, UIKeyboardAutomatic, UILabel, UINavigationBar, UISearchBar,
               UISegmentedControl, UISwitch, UITableView, UITableViewCell, UITextField, UIView, UIWebView]
    classes.each do |klass|
      describe "#{klass}.class_name" do
        it 'should return class name' do
          klass.class_name.must_equal(klass.to_s)
        end
      end

      describe "#{klass}.touch and aliases" do
        it 'should call Calabash touch method with correct parameters' do
          klass.touch
          $uiquery.must_equal("#{klass.class_name}")

          klass.touch(0)
          $uiquery.must_equal("#{klass.class_name} index:0")

          klass.touch('myId')
          $uiquery.must_equal("#{klass.class_name} marked:'myId'")

          klass.tap
          $uiquery.must_equal("#{klass.class_name}")

          klass.tap(0)
          $uiquery.must_equal("#{klass.class_name} index:0")

          klass.tap('myId')
          $uiquery.must_equal("#{klass.class_name} marked:'myId'")
        end
      end

      describe "#{klass}.double_tap" do
        it 'should call Calabash double_tap method with correct parameters' do
          klass.double_tap
          $uiquery.must_equal(klass.class_name)

          klass.double_tap(0)
          $uiquery.must_equal("#{klass.class_name} index:0")

          klass.double_tap('myId')
          $uiquery.must_equal("#{klass.class_name} marked:'myId'")
        end
      end

      describe "#{klass}.property and aliases" do
        it 'should call Calabash query method with correct parameters' do
          klass.property(:finland)
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:finland)

          klass.prop(:finland)
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:finland)

          klass.p(:finland)
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:finland)
        end
      end

      describe "#{klass}.accessibility_label and aliases" do
        it 'should call Calabash query method with correct parameters' do
          klass.accessibility_label
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:accessibilityLabel)

          klass.label
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:accessibilityLabel)
        end
      end

      describe "#{klass}.accessibility_identifier and aliases" do
        it 'should call Calabash query method with correct parameters' do
          klass.accessibility_identifier
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:accessibilityIdentifier)

          klass.identifier
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:accessibilityIdentifier)
        end
      end

      describe "#{klass}.enabled?" do
        it 'should call Calabash query method with correct parameters' do
          $stub_query_response = [true, false]

          klass.enabled?.must_equal(true)
          $uiquery.must_equal("#{klass.class_name}")
          $args.first.must_equal(:isEnabled)

          klass.enabled?(0).must_equal(true)
          $uiquery.must_equal("#{klass.class_name} index:0")
          $args.first.must_equal(:isEnabled)

          klass.enabled?('myId').must_equal(true)
          $uiquery.must_equal("#{klass.class_name} marked:'myId'")
          $args.first.must_equal(:isEnabled)
        end
      end
    end

    describe 'UIBase.fail_if_invalid' do
      it 'should raise' do
        proc { UIButton.text(:symbol) }.must_raise(RuntimeError)
        proc { UIButton.touch(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionView.empty?(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.selected?(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.touch(:symbol) }.must_raise(RuntimeError)
        proc { UICollectionViewCell.double_tap(:symbol) }.must_raise(RuntimeError)
        proc { UILabel.text(:symbol) }.must_raise(RuntimeError)
        proc { UILabel.touch(:symbol) }.must_raise(RuntimeError)
        proc { UISwitch.on?(:symbol) }.must_raise(RuntimeError)
        proc { UISwitch.touch(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.text(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.selected?(:symbol) }.must_raise(RuntimeError)
        proc { UITableViewCell.touch(:symbol) }.must_raise(RuntimeError)
        proc { UITextField.text(:symbol) }.must_raise(RuntimeError)
        proc { UITextField.touch(:symbol) }.must_raise(RuntimeError)
      end
    end

    describe 'UIBase.parse_query' do
      it 'should parse query' do
        UIButton.parse_query(nil).must_equal('UIButton')
        UIButton.parse_query(0).must_equal('UIButton index:0')
        UIButton.parse_query('myId').must_equal("UIButton marked:'myId'")

        UICollectionView.parse_query(nil).must_equal('UICollectionView')
        UICollectionView.parse_query(0).must_equal('UICollectionView index:0')
        UICollectionView.parse_query('myId').must_equal("UICollectionView marked:'myId'")

        UICollectionViewCell.parse_query(nil).must_equal('UICollectionViewCell')
        UICollectionViewCell.parse_query(0).must_equal('UICollectionViewCell index:0')
        UICollectionViewCell.parse_query('myId').must_equal("UICollectionViewCell marked:'myId'")

        UILabel.parse_query(nil).must_equal('UILabel')
        UILabel.parse_query(0).must_equal('UILabel index:0')
        UILabel.parse_query('myId').must_equal("UILabel marked:'myId'")

        UISwitch.parse_query(nil).must_equal('UISwitch')
        UISwitch.parse_query(0).must_equal('UISwitch index:0')
        UISwitch.parse_query('myId').must_equal("UISwitch marked:'myId'")

        UITableViewCell.parse_query(nil).must_equal('UITableViewCell')
        UITableViewCell.parse_query(0).must_equal('UITableViewCell index:0')
        UITableViewCell.parse_query('myId').must_equal("UITableViewCell marked:'myId'")

        UITextField.parse_query(nil).must_equal('UITextField')
        UITextField.parse_query(0).must_equal('UITextField index:0')
        UITextField.parse_query('myId').must_equal("UITextField marked:'myId'")
      end
    end
  end
end
