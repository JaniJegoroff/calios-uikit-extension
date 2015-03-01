require_relative 'spec_helper'

# Test class for UITextField
class SpecUITextField < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UITextField' do
    describe 'UITextField.text' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(abc def ghi)

        UITextField.text.must_equal('abc')
        @core.ui_query.must_equal("#{UITextField.class_name}")
        @core.args.first.must_equal(:text)

        UITextField.text(0).must_equal('abc')
        @core.ui_query.must_equal("#{UITextField.class_name} index:0")
        @core.args.first.must_equal(:text)

        UITextField.text('myId').must_equal('abc')
        @core.ui_query.must_equal("#{UITextField.class_name} marked:'myId'")
        @core.args.first.must_equal(:text)
      end
    end
  end
end
