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
  end
end
