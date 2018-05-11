require 'hugger/version'

require 'dry/inflector'
require 'hugger/object'
require 'hugger/string'
require 'hugger/huggable'

# Module
# @since 0.0.1
module Hugger
  class << self
    def inflector
      @inflector ||= Dry::Inflector.new
    end
  end
end
