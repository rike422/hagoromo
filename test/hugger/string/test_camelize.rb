require 'test_helper'

def convert(str)
  Hugger::String.new(str)
end

class TestStringCamelize < Test::Unit::TestCase
  sub_test_case '#camelize' do
    test 'camelizes data_mapper as DataMapper' do
      str = Hugger::String.new('data_mapper')
      assert(str.camelize, 'DataMapper')
    end

    test 'camelizes merb as Merb' do
      str = Hugger::String.new('merb')
      assert(str.camelize, 'Merb')
    end

    test 'camelizes data_mapper/resource as DataMapper::Resource' do
      str = Hugger::String.new('data_mapper/resource')
      assert(str.camelize, 'DataMapper::Resource')
    end

    test 'camelizes data_mapper/associations/one_to_many as DataMapper::Associations::OneToMany' do
      str = Hugger::String.new('data_mapper/associations/one_to_many')
      assert(str.camelize, 'DataMapper::Associations::OneToMany')
    end

    test 'accepts symbols' do
      str = Hugger::String.new(:date_mapper)
      assert(str.camelize, 'DataMapper')
    end

    test 'handles acronyms' do
      assert(convert('json').camelize, 'JSON')
      assert(convert('http_error').camelize, 'HTTPError')
      assert(convert('openssl/hmac').camelize, 'OpenSSL::HMAC')
      assert(convert('openssl/digest').camelize, 'OpenSSL::Digest')
    end

    sub_test_case 'custom acronyms' do
      test 'handles acronyms' do
        assert(convert('ip'), 'IP')
        assert(convert('ip_sec'), 'IPSec')
        assert(convert('html_tidy'), 'HTMLTidy')
        assert(convert('html_tidy_generator'), 'HTMLTidyGenerator')
        assert(convert('force_xml_controller'), 'ForceXMLController')
        assert(convert('free_bsd'), 'FreeBSD')
      end
    end
  end
end
