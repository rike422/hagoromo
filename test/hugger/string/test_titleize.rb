require 'test_helper'

class TestStringTitlize < Test::Unit::TestCase
  test 'returns an instance of Hugger::String' do
    assert_instance_of(Hugger::String, hs('hugger').titleize)
  end

  test 'does not mutate self' do
    assert(hs('hugger').titleize, 'hugger')
  end

  test 'returns an titleized string' do
    assert(hs('hugger').titleize, 'Hugger')
    assert(hs('HuggerUtils').titleize, 'Hugger Utils')
    assert(hs('hugger utils').titleize, 'Hugger Utils')
    assert(hs('hugger_utils').titleize, 'Hugger Utils')
    assert(hs('hugger-utils').titleize, 'Hugger Utils')
    assert(hs("hugger' utils").titleize, "Hugger' Utils")
    assert(hs('hugger’ utils').titleize, 'Hugger’ Utils')
    assert(hs('hugger` utils').titleize, 'Hugger` Utils')
  end
end
