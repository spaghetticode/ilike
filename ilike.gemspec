# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ilike/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["andrea longhi"]
  gem.email         = ["andrea@spaghetticode.it"]
  gem.description   = %q{easy way to match strings with active record}
  gem.summary       = %q{easy way to match strings with active record}
  gem.homepage      = "https://github.com/spaghetticode/ilike"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ilike"
  gem.require_paths = ["lib"]
  gem.version       = Ilike::VERSION

  gem.add_dependency 'activerecord', '>= 3.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'sqlite3'
end
