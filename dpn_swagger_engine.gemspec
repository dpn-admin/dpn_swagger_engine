# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require 'swagger_engine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'dpn_swagger_engine'
  spec.version     = SwaggerEngine::VERSION
  spec.authors     = ['batdevis', 'Darren Weber']
  spec.email       = ['batdevis@gmail.com', 'dweber.consulting@gmail.com']
  spec.homepage    = 'https://github.com/dpn-admin/dpn_swagger_engine'
  spec.summary     = 'Mount swagger-ui as rails engine.'
  spec.description = 'API docs for dpn-server.'
  spec.license     = 'MIT'

  # spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # spec.test_files = Dir["test/**/*"]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'yard'
end
