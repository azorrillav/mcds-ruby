# frozen_string_literal: true

lib = File.expand_path('./lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'mcds-ruby'
  s.version       = '0.0.1'
  s.authors       = [ 'Andres Zorrilla']
  s.email         = ['andres.zorrilla.login@hingehealth.com']
  s.required_ruby_version     = '>= 3.1.4'
  s.required_rubygems_version = '>= 1.8.11'

  s.summary       = 'A Ruby API client for MCDS API'
  s.description   = 'A Ruby API client for Member Care Data Service API'
  s.homepage      = 'https://github.com/azorrillav/mcds-ruby'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  s.add_development_dependency 'json', '~> 2.6', '>= 2.6.2'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  s.add_development_dependency 'faraday', '~> 2.6', '>= 2.6.0'
  s.add_development_dependency 'rspec', '~> 3.11', '>= 3.11.0'
end