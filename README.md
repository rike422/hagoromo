# Hugger  [![Gem Version](https://badge.fury.io/rb/hugger.svg)](https://badge.fury.io/rb/hugger) [![Build Status](https://travis-ci.org/rike422/hugger.svg?branch=master)](https://travis-ci.org/rike422/hugger)  [![Code Climate](https://codeclimate.com/github/rike422/hugger/badges/gpa.svg)](https://codeclimate.com/github/rike422/hugger) [![Coverage Status](https://coveralls.io/repos/github/rike422/hugger/badge.svg?branch=master)](https://coveralls.io/github/rike422/hugger?branch=master)




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hugger'
```

## Usage



### Hugger::String

```ruby
require 'hugger'

class SampleClass
  include Hugger::Haggable
  
  hug_string :wrap
  def wrap(a)
    "#{a}_is_huged_by_hugger"
  end
  
  def dynamic_wrap(b)
    hug "#{b}_is_hugged_by_hugger"
  end
end

c = SampleClass.new
c.wrap('rike422').class => Hugger::String
c.dynamic_wrap('rike422').class => Hugger::String

c.dynamic_wrap('rike422').camelize # => "rike422_is_hugged_by_hugger"
c.dynamic_wrap('rike422').camelize.underscore # > "rike422_is_hugged_by_hugger"
c.dynamic_wrap('rike422').classify # => "Rike422IsHugedByHugger"
c.dynamic_wrap('rike422').dasherize # => "rike422-is-hugged-by-hugger"
c.dynamic_wrap('rike422').titleize # => "Rike422 Is Hugged By Hugger"
c.dynamic_wrap('rike422').pluralize # => "rike422_is_hugged_by_huggers"
c.dynamic_wrap('rike422').pluralize.singularize # => "rike422_is_hugged_by_hugger"


Hugger::String.titleize('hugger utils') # => "Hugger Utils"
Hugger::String.camelize('hugger utils') # => "Hugger utils"
Hugger::String.classify('hugger_utils') # => 'HuggerUtils'
Hugger::String.underscore('HuggerUtils') # => 'hugger_utils'
Hugger::String.dasherize('Hugger Utils') # => 'hugger-utils'
Hugger::String.dasherize('hugger_utils') # => 'hugger-utils'
Hugger::String.dasherize('HuggerUtils') # => "hugger-utils"
Hugger::String.demodulize(Hugger::String.name) # => "String"
Hugger::String.namespace(Hugger::String.name) # => "Hugger"
Hugger::String.pluralize('book') # => 'books'
Hugger::String.singularize('books') # => 'book'

```

## Thanks

This project borrow codes from following projects:
  
  
  - [Hanami](https://github.com/hanami/utils)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

