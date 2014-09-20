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
  end
end
