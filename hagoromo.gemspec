
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hugger/version'

Gem::Specification.new do |spec|
  spec.name          = 'hugger'
  spec.version       = Hugger::VERSION
  spec.authors       = ['Akira Takahashi']
  spec.email         = ['rike422@gmail.com']

  spec.summary       = 'Collection of utility wrapper class for Ruby'
  spec.description   = 'Collection of utility wrapper class for Ruby'
  spec.homepage      = 'https://github.com/rike422/hugger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-inflector'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'test-unit-full'
  spec.add_development_dependency 'yard'
end
