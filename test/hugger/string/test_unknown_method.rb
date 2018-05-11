require 'test_helper'

class TestUnknownMethod < Test::Unit::TestCase
  test 'raises error' do
    assert_raise(NoMethodError, %(undefined method `yay!' for "one":Hugger::String)) do
      Hugger::String.new('one').yay!
    end
  end

  test 'returns the correct object when a NoMethodError is raised' do
    string = Hugger::String.new('/path/to/something')
    exception_message = %(undefined method `boom' for "/":String)

    assert_raise(NoMethodError, exception_message) do
      string.gsub(%r{/}, &:boom)
    end
  end
end
