# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UISwitch
class SpecUISwitch < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UISwitch' do
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
  end
end
