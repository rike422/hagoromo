require 'test_helper'

class TestStringTokinize < Test::Unit::TestCase
  setup do
    @logger = []
  end

  teardown do
    @logger = []
  end

  test 'returns an instance of Hugger::String' do
    string = Hugger::String.new('Hugger::(Utils|App)')
    string.tokenize do |token|
      @logger.push token
    end

    @logger.each do |l|
      assert_instance_of(Hugger::String, l)
    end
  end

  test 'calls the given block for each token occurrence' do
    string = Hugger::String.new('Hugger::(Utils|App)')
    string.tokenize do |token|
      @logger.push token
    end
    assert_equal(@logger[0], hs('Hugger::Utils'))
    assert_equal(@logger[1], hs('Hugger::App'))
  end

  test 'guarantees the block to be called even when the token conditions are not met' do
    string = Hugger::String.new('Hugger')
    string.tokenize do |token|
      @logger.push token
    end

    assert_equal(@logger, [Hugger::String.new('Hugger')])
  end

  test 'returns nil' do
    result = Hugger::String.new('Hugger::(Utils|App)').tokenize {}
    assert_nil(result)
  end
end
