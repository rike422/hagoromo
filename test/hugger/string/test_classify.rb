require 'test_helper'

class TestStringClassify < Test::Unit::TestCase
  test 'classifies data_mapper as DataMapper' do
    assert(hs('data_mapper').classify, 'DataMapper')
  end

  test 'classifies data.mapper as Mapper' do
    assert(hs('data.mapper').classify, 'Mapper')
  end

  test 'classifies enlarged_testes as EnlargedTestis' do
    assert(hs('enlarged_testes').classify, 'EnlargedTestis')
  end

  test 'singularizes string first: classifies data_mappers as egg_and_hams as EggAndHam' do
    assert(hs('egg_and_hams').classify, 'EggAndHam')
  end

  test 'accepts symbols' do
    assert(hs(:data_mapper).classify, 'DataMapper')
  end
end
