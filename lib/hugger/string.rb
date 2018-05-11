module Hugger
  # String
  # @since 0.0.1
  class String
    include Hugger::Object

    # Empty string for #classify
    #
    # @since 0.0.1
    # @api private
    EMPTY_STRING = ''.freeze

    # Separator between Ruby namespaces
    #
    # @since 0.0.1
    # @api private
    NAMESPACE_SEPARATOR = '::'.freeze

    # Regexp for #tokenize
    #
    # @since 0.0.1
    # @api private
    TOKENIZE_REGEXP = /\((.*)\)/

    # Separator for #tokenize
    #
    # @since 0.0.1
    # @api private
    TOKENIZE_SEPARATOR = '|'.freeze

    # Separator for #underscore
    #
    # @since 0.0.1
    # @api private
    UNDERSCORE_SEPARATOR = '/'.freeze

    # gsub second parameter used in #underscore
    #
    # @since 0.0.1
    # @api private
    UNDERSCORE_DIVISION_TARGET = '\1_\2'.freeze

    # Separator for #titleize
    #
    # @since 0.0.1
    # @api private
    TITLEIZE_SEPARATOR = ' '.freeze

    # Separator for Ruby file name
    #
    # @since 0.0.1
    # @api private
    CLASSIFY_SEPARATOR = '_'.freeze

    # Separator for #capitalize
    #
    # @since 0.0.1
    # @api private
    CAPITALIZE_SEPARATOR = ' '.freeze

    # Separator for #dasherize
    #
    # @since 0.0.1
    # @api private
    DASHERIZE_SEPARATOR = '-'.freeze

    class << self
      # Return a titleized version of the string
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.titleize('hugger utils') # => "Hugger Utils"

      def titleize(input)
        string = new(input.to_s).titlize
        new(string)
      end

      # Return a camelize version of the string
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.camelize('hugger utils') # => "Hugger Utils"
      def camelize(input)
        string = ::String.new(input.to_s)
        new(string).camelize
      end

      # Return a CamelCase version of the string
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.classify('hugger_utils') # => 'HuggerUtils'
      def classify(input)
        string = ::String.new(input.to_s)
        new(string).classify
      end

      # Return a downcased and underscore separated version of the string
      #
      # Revised version of `ActiveSupport::Inflector.underscore` implementation
      # @see https://github.com/rails/rails/blob/feaa6e2048fe86bcf07e967d6e47b865e42e055b/activesupport/lib/active_support/inflector/methods.rb#L90
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.underscore('HuggerUtils') # => 'hugger_utils'
      def underscore(input)
        string = ::String.new(input.to_s)
        new(string).underscore
      end

      # Return a downcased and dash separated version of the string
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.dasherize('Hugger Utils') # => 'hugger-utils'
      #
      #   Hugger::String.dasherize('hugger_utils') # => 'hugger-utils'
      #
      #   Hugger::String.dasherize('HuggerUtils') # => "hugger-utils"
      def dasherize(input)
        string = ::String.new(input.to_s)
        new(string).dasherize
      end

      # Return the string without the Ruby namespace of the class
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.demodulize('Hugger::String') # => 'String'
      #
      #   Hugger::String.demodulize('String') # => 'String'
      def demodulize(input)
        string = ::String.new(input.to_s)
        new(string).demodulize
      end

      # Return the top level namespace name
      #
      # @param input [::String] the input
      #
      # @return [::String] the transformed string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.namespace('Hugger::String') # => 'Hugger'
      #
      #   Hugger::String.namespace('String') # => 'String'
      def namespace(input)
        ::String.new(input.to_s).split(NAMESPACE_SEPARATOR).first
      end

      # Return a pluralized version of self.
      #
      # @param input [::String] the input
      #
      # @return [::String] the pluralized string.
      #
      # @since 0.0.1
      #
      # @see Hugger::Inflector
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.pluralize('book') # => 'books'
      def pluralize(input)
        string = ::String.new(input.to_s)
        new(string).pluralize
      end

      # Return a singularized version of self.
      #
      # @param input [::String] the input
      #
      # @return [::String] the singularized string.
      #
      # @since 0.0.1
      #
      # @see Hugger::Inflector
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.singularize('books') # => 'book'
      def singularize(input)
        string = ::String.new(input.to_s)
        new(string).singularize
      end

      # Replace the rightmost match of `pattern` with `replacement`
      #
      # If the pattern cannot be matched, it returns the original string.
      #
      # This method does NOT mutate the original string.
      #
      # @param input [::String] the input
      # @param pattern [Regexp, ::String] the pattern to find
      # @param replacement [String] the string to replace
      #
      # @return [::String] the replaced string
      #
      # @since 0.0.1
      #
      # @example
      #   require 'hugger/string'
      #
      #   Hugger::String.rsub('authors/books/index', %r{/}, '#')
      #     # => 'authors/books#index'
      def rsub(input, pattern, replacement)
        string = ::String.new(input.to_s)
        if i = string.rindex(pattern) # rubocop:disable Lint/AssignmentInCondition
          s    = string.dup
          s[i] = replacement
          s
        else
          string
        end
      end
    end

    # Initialize the string
    #
    # @param string [::String, Symbol] the value we want to initialize
    #
    # @return [Hugger::String] self
    #
    # @since 0.0.1
    def initialize(string)
      @string = string.to_s
    end

    # Return a titleized version of the string
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'hugger utils'
    #   string.titleize # => "Hugger Utils"
    def titleize
      self.class.new underscore.split(CLASSIFY_SEPARATOR).map(&:capitalize).join(TITLEIZE_SEPARATOR)
    end

    # Return a camelize version of the string
    #
    # @param input [::String] the input
    #
    # @return [::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   Hugger::String.new('hugger utils').camelize # => "Hugger Utils"

    def camelize
      self.class.new(Hugger.inflector.camelize(@string))
    end

    # Return a CamelCase version of the string
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'hugger_utils'
    #   string.classify # => 'HuggerUtils'
    def classify
      self.class.new(Hugger.inflector.classify(@string))
    end

    # Return a downcased and underscore separated version of the string
    #
    # Revised version of `ActiveSupport::Inflector.underscore` implementation
    # @see https://github.com/rails/rails/blob/feaa6e2048fe86bcf07e967d6e47b865e42e055b/activesupport/lib/active_support/inflector/methods.rb#L90
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'HuggerUtils'
    #   string.underscore # => 'hugger_utils'
    def underscore
      self.class.new Hugger.inflector.underscore(@string)
    end

    # Return a downcased and dash separated version of the string
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'Hugger Utils'
    #   string.dasherize # => 'hugger-utils'
    #
    #   string = Hugger::String.new 'hugger_utils'
    #   string.dasherize # => 'hugger-utils'
    #
    #   string = Hugger::String.new 'HuggerUtils'
    #   string.dasherize # => "hugger-utils"
    def dasherize
      self.class.new(Hugger.inflector.dasherize(@string))
    end

    # Return the string without the Ruby namespace of the class
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'Hugger::String'
    #   string.demodulize # => 'String'
    #
    #   string = Hugger::String.new 'String'
    #   string.demodulize # => 'String'
    def demodulize
      self.class.new(Hugger.inflector.demodulize(@string))
    end

    # Return the top level namespace name
    #
    # @return [Hugger::String] the transformed string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'Hugger::String'
    #   string.namespace # => 'Hugger'
    #
    #   string = Hugger::String.new 'String'
    #   string.namespace # => 'String'
    def namespace
      self.class.new split(NAMESPACE_SEPARATOR).first
    end

    # It iterates through the tokens and calls the given block.
    # A token is a substring wrapped by `()` and separated by `|`.
    #
    # @yield the block that is called for each token.
    #
    # @return [void]
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new 'Hugger::(Utils|App)'
    #   string.tokenize do |token|
    #     puts token
    #   end
    #
    #   # =>
    #     'Hugger'
    #     'Hugger::App'
    def tokenize # rubocop:disable Metrics/MethodLength
      if match = TOKENIZE_REGEXP.match(@string) # rubocop:disable Lint/AssignmentInCondition
        pre    = match.pre_match
        post   = match.post_match
        tokens = match[1].split(TOKENIZE_SEPARATOR)
        tokens.each do |token|
          yield(self.class.new("#{pre}#{token}#{post}"))
        end
      else
        yield(self.class.new(@string))
      end

      nil
    end

    # Return a pluralized version of self.
    #
    # @return [Hugger::String] the pluralized string.
    #
    # @api private
    # @since 0.0.1
    def pluralize
      self.class.new Hugger.inflector.pluralize(self)
    end

    # Return a singularized version of self.
    #
    # @return [Hugger::String] the singularized string.
    #
    # @api private
    # @since 0.0.1
    def singularize
      self.class.new Hugger.inflector.singularize(self)
    end

    # Returns the hash of the internal string
    #
    # @return [Integer]
    #
    # @since 0.0.1
    def hash
      @string.hash
    end

    # Returns a string representation
    #
    # @return [::String]
    #
    # @since 0.0.1
    def to_s
      @string
    end

    alias to_str to_s

    # Equality
    #
    # @return [TrueClass,FalseClass]
    #
    # @since 0.0.1
    def ==(other)
      to_s == other
    end

    alias eql? ==

    # Split the string with the given pattern
    #
    # @return [Array<Hugger::String>]
    #
    # @see http://www.ruby-doc.org/core/String.html#method-i-split
    #
    # @since 0.0.1
    def split(pattern, limit = 0)
      @string.split(pattern, limit).map { |s| self.class.new(s) }
    end

    # Replace the given pattern with the given replacement
    #
    # @return [Hugger::String]
    #
    # @see http://www.ruby-doc.org/core/String.html#method-i-gsub
    #
    # @since 0.0.1
    def gsub(pattern, replacement = nil, &blk)
      s = if block_given?
            @string.gsub(pattern, &blk)
          else
            @string.gsub(pattern, replacement)
          end
      self.class.new(s)
    end

    # Iterate through the string, matching the pattern.
    # Either return all those patterns, or pass them to the block.
    #
    # @return [Array<Hugger::String>]
    #
    # @see http://www.ruby-doc.org/core/String.html#method-i-scan
    #
    # @since 0.0.1
    def scan(pattern, &blk)
      @string.scan(pattern, &blk).map { |s| self.class.new(s) }
    end

    # Replace the rightmost match of `pattern` with `replacement`
    #
    # If the pattern cannot be matched, it returns the original string.
    #
    # This method does NOT mutate the original string.
    #
    # @param pattern [Regexp, String] the pattern to find
    # @param replacement [String, Hugger::String] the string to replace
    #
    # @return [Hugger::String] the replaced string
    #
    # @since 0.0.1
    #
    # @example
    #   require 'hugger/string'
    #
    #   string = Hugger::String.new('authors/books/index')
    #   result = string.rsub(/\//, '#')
    #
    #   puts string
    #     # => #<Hugger::String:0x007fdb41233ad8 @string="authors/books/index">
    #
    #   puts result
    #     # => #<Hugger::String:0x007fdb41232ed0 @string="authors/books#index">
    def rsub(pattern, replacement)
      if i = rindex(pattern) # rubocop:disable Lint/AssignmentInCondition
        s    = @string.dup
        s[i] = replacement
        self.class.new s
      else
        self
      end
    end

    # Override Ruby's method_missing in order to provide ::String interface
    #
    # @api private
    # @since 0.0.1
    #
    # @raise [NoMethodError] If doesn't respond to the given method
    # rubocop:disable Style/MethodMissing
    def method_missing(method_name, *args, &blk)
      raise NoMethodError, %(undefined method `#{method_name}' for "#{@string}":#{self.class}) unless respond_to_missing?(method_name)

      s = @string.__send__(method_name, *args, &blk)
      case s
      when ::String
        self.class.new(s)
      when Array
        s.map { |p| self.class.new(p) }
      else
        s
      end
    end

    # rubocop:enable Style/MethodMissing

    # Override Ruby's respond_to_missing? in order to support ::String interface
    #
    # @api private
    # @since 0.0.1
    def respond_to_missing?(method_name, include_private = false)
      @string.respond_to?(method_name, include_private)
    end

    # Private internal interface for Hugger::Object
    #
    # @api private
    # @since 0.0.1
    def object
      @string
    end

    # inspect
    #
    # @api private
    # @since 0.0.1
    def inspect
      object.inspect
    end
  end
end
