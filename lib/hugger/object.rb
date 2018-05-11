module Hugger
  # Object
  # @since 0.0.1
  # @api private
  module Object
    STRING_MATCHER = /\A[[:space:]]*\z/

    # Checks object is blank
    # @return [TrueClass,FalseClass]
    # @since 0.0.1
    def blank?
      case object
      when String, ::String
        STRING_MATCHER === object # rubocop:disable Style/CaseEquality
        # when Hash, ::Hash, ::Array
        #   object.empty?
        # when TrueClass, Numeric
        #   false
        # when FalseClass, NilClass
        #   true
        # else
        #   object.respond_to?(:empty?) ? object.empty? : !self
      end
    end

    # Checks object is present
    # @return [TrueClass,FalseClass]
    # @since 0.0.1
    def present?
      !blank?
    end

    #
    # @return [TrueClass,FalseClass]
    # @since 0.0.1
    def object
      raise 'Not'
    end
  end
end
