# rubocop:disable Style/GlobalVars

require_relative 'spec_helper'

# Test class for UILabel
class SpecUILabel < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'UILabel' do
    describe 'UILabel.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(abc def ghi)

        UILabel.text.must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name}")
        $args.first.must_equal(:text)

        UILabel.text(0).must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name} index:0")
        $args.first.must_equal(:text)

        UILabel.text('myId').must_equal('abc')
        $uiquery.must_equal("#{UILabel.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end
  end
end
