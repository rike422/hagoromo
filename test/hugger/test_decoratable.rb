require 'test_helper'

class MockString
  include Hugger::Huggable
  hug_string :string_method

  def string_method(a, b)
    "#{a} is #{b}"
  end

  def string_method2(a, b)
    hug "#{a} or #{b}"
  end
end

class TestHaggable < Test::Unit::TestCase
  test '::String class wrapped by Hugger::String' do
    s = MockString.new
    r = s.string_method('a', 'b')
    assert_instance_of(Hugger::String, r)
    assert_equal(r, 'a is b')
  end

  sub_test_case 'instant hug' do
    test '::String class wrapped by Hugger::String' do
      s = MockString.new
      r = s.string_method2('a', 'b')
      assert_instance_of(Hugger::String, r)
      assert_equal(r, 'a or b')
    end
  end
end
