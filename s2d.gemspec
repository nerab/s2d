# -*- encoding: utf-8 -*-
require File.expand_path('../lib/s2d/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.at"]
  gem.description   = %q{Send text and documentation to various devices from the command line.}
  gem.summary       = %q{s2d - Send to Device}
  gem.homepage      = "http://github.com/nerab/s2d"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "s2d"
  gem.require_paths = ["lib"]
  gem.version       = S2D::VERSION

  gem.add_dependency 'prowler'
  
  gem.add_development_dependency 'guard-test', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'pry'
end
