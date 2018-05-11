module Hugger
  # String
  # @since 0.0.1
  module Huggable
    def self.included(klass)
      super
      klass.extend(ClassMethods)
    end

    # Decorates the object using the Hugger classes
    # @param [Object]
    def hug(value)
      case value
      when ::String, String
        Hugger::String.new(value)
      end
    end
  end

  # Haggable class methods
  # @since 0.0.1
  module ClassMethods
    # Decorates object from given method using the Hugger classes
    # @param [Object]
    def hug_string(*args)
      m = Module.new
      args.each do |method|
        m.class_eval <<-STRING_WRAPPER, __FILE__, __LINE__ + 1
          def #{method}(*args)
            Hugger::String.new(super(*args))
          end
      STRING_WRAPPER
      end
      prepend(m)
    end
  end
end
