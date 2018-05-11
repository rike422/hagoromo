require 'test_helper'

class TestStringInflector < Test::Unit::TestCase
  sub_test_case 'camelize' do
    test 'classMethod' do
      stub(Hugger.inflector).camelize
      Hugger::String.camelize('hugger')
      assert_received(Hugger.inflector) { |i| i.camelize('hugger') }
    end
    test 'method' do
      stub(Hugger.inflector).camelize
      Hugger::String.new('hugger').camelize
      assert_received(Hugger.inflector) { |i| i.camelize('hugger') }
    end
  end

  sub_test_case 'classify' do
    test 'classMethod' do
      stub(Hugger.inflector).classify
      Hugger::String.classify('hugger')
      assert_received(Hugger.inflector) { |i| i.classify('hugger') }
    end
    test 'method' do
      stub(Hugger.inflector).classify
      Hugger::String.new('hugger').classify
      assert_received(Hugger.inflector) { |i| i.classify('hugger') }
    end
  end

  sub_test_case 'underscore' do
    test 'classMethod' do
      stub(Hugger.inflector).underscore
      Hugger::String.underscore('hugger')
      assert_received(Hugger.inflector) { |i| i.underscore('hugger') }
    end
    test 'method' do
      stub(Hugger.inflector).underscore
      Hugger::String.new('hugger').underscore
      assert_received(Hugger.inflector) { |i| i.underscore('hugger') }
    end
  end

  sub_test_case '#dasherize' do
    test 'classMethod' do
      stub(Hugger.inflector).dasherize
      Hugger::String.dasherize('hugger')
      assert_received(Hugger.inflector) { |i| i.dasherize('hugger') }
    end
    test 'method' do
      stub(Hugger.inflector).dasherize
      Hugger::String.new('hugger').dasherize
      assert_received(Hugger.inflector) { |i| i.dasherize('hugger') }
    end
  end
end
