# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'retrying/version'

Gem::Specification.new do |spec|
  spec.name          = "retrying"
  spec.version       = Retrying::VERSION
  spec.authors       = ["Tomasz Szymczyszyn"]
  spec.email         = ["tomasz.szymczyszyn@gmail.com"]
  spec.description   = %q{Easily retry block of code in case of an exception}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/kammerer/retrying"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
