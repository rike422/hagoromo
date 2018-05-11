require 'test_helper'

class TestStringEqualtesty < Test::Unit::TestCase
  test 'has a working equaltesty' do
    string = Hugger::String.new('hugger')
    other  = Hugger::String.new('hugger')

    assert_equal(string, other)
  end

  test 'has a working equaltesty wtesth raw strings' do
    string = Hugger::String.new('hugger')
    assert_equal(string, 'hugger')
  end

  sub_test_case 'case equaltesty' do
    test 'has a working case equaltesty' do
      string = Hugger::String.new('hugger')
      other  = Hugger::String.new('hugger')
      assert_true(string.===(other))
    end

    test 'has a working case equaltesty wtesth raw strings' do
      string = Hugger::String.new('hugger')
      assert_true(string.===('hugger'))
    end
  end

  sub_test_case 'identtesty equaltesty' do
    test 'has a working identtesty equaltesty' do
      string = Hugger::String.new('hugger')
      assert_same(string, string)
    end

    test 'has a working identtesty equaltesty wtesth raw strings' do
      string = Hugger::String.new('hugger')
      assert_not_same(string, 'hugger')
    end
  end
end
