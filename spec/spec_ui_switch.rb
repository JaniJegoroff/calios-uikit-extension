require_relative 'spec_helper'

# Test class for UISwitch
class SpecUISwitch < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UISwitch' do
    describe 'UISwitch.on?' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = [false, true]
        ret = UISwitch.on?
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UISwitch.class_name}")
        @core.args.first.must_equal(:isOn)

        @core.response = [false, true]
        ret = UISwitch.on?(0)
        ret.must_equal(false)
        @core.ui_query.must_equal("#{UISwitch.class_name} index:0")
        @core.args.first.must_equal(:isOn)

        @core.response = [true, false]
        ret = UISwitch.on?('myId')
        ret.must_equal(true)
        @core.ui_query.must_equal("#{UISwitch.class_name} marked:'myId'")
        @core.args.first.must_equal(:isOn)
      end
    end
  end
end
