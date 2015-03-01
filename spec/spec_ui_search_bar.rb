require_relative 'spec_helper'

# Test class for UISearchBar
class SpecUISearchBar < Minitest::Spec
  before do
    @core = Calabash::Cucumber::Core
  end

  describe 'UISearchBar' do
    describe 'UISearchBar.text' do
      it 'should call Calabash query method with correct parameters' do
        @core.response = %w(abc def ghi)

        UISearchBar.text.must_equal('abc')
        @core.ui_query.must_equal("#{UISearchBar.class_name}")
        @core.args.first.must_equal(:text)

        UISearchBar.text(0).must_equal('abc')
        @core.ui_query.must_equal("#{UISearchBar.class_name} index:0")
        @core.args.first.must_equal(:text)

        UISearchBar.text('myId').must_equal('abc')
        @core.ui_query.must_equal("#{UISearchBar.class_name} marked:'myId'")
        @core.args.first.must_equal(:text)
      end
    end
  end
end
