# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nagctl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Aaron Brown"]
  gem.email         = ["abrown@ideeli.com"]
  gem.description   = %q{Control Nagios downtime with a simple REST interface}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "https://github.com/9minutesnooze/nagctl"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nagctl"
  gem.require_paths = ["lib"]
  gem.version       = Nagctl::VERSION

  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-contrib'
  gem.add_dependency 'json'
end
