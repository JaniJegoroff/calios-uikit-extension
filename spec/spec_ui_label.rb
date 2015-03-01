require_relative 'spec_helper'

# Test class for UILabel
class SpecUILabel < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UILabel' do
    describe 'UILabel.text' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(abc def ghi)

        UILabel.text.must_equal('abc')
        @core.ui_query.must_equal("#{UILabel.class_name}")
        @core.args.first.must_equal(:text)

        UILabel.text(0).must_equal('abc')
        @core.ui_query.must_equal("#{UILabel.class_name} index:0")
        @core.args.first.must_equal(:text)

        UILabel.text('myId').must_equal('abc')
        @core.ui_query.must_equal("#{UILabel.class_name} marked:'myId'")
        @core.args.first.must_equal(:text)
      end
    end
  end
end
