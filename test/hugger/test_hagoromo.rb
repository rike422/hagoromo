require 'test_helper'

class TestSample < Test::Unit::TestCase
  def test_version
    version = Hugger.const_get('VERSION')

    assert(!version.empty?, 'should have a VERSION constant')
  end
end
