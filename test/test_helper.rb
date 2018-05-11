require 'rubygems'

if ENV['CI']
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
    ]
  )
  SimpleCov.start do
    add_group 'lib', 'lib'
    add_filter '/vendor/'
  end
end

require 'hugger'

require 'test/unit'
require 'test/unit/notify'
require 'test/unit/rr'


def hs(s)
  Hugger::String.new(s)
end

