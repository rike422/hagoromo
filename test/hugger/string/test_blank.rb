require 'test_helper'

class TestStringCamelize < Test::Unit::TestCase
  sub_test_case '#camelize' do
    [
      '',
      '   ',
      "  \n\t  \r ",
      '　',
      "\u00a0"
    ].each do |s|
      test "#{s} return true" do
        assert_true(Hugger::String.new(s).blank?)
      end
      test "#{s} return false" do
        assert_false(Hugger::String.new(s).present?)
      end
    end
  end
end
