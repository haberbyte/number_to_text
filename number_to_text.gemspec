# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_to_text/version'

Gem::Specification.new do |s|
  s.name        = 'number_to_text'
  s.version     = NumberToText::VERSION
  s.authors     = ['Ann-Christin Preuß', 'Jan Habermann']
  s.email       = ['jan@habermann24.com']

  s.summary     = 'Convert numbers to spoken text'
  s.description = 'A simple helper that converts numbers to text'
  s.homepage    = 'https://github.com/habermann24/number_to_text'

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.files        = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.add_runtime_dependency 'activesupport', '>= 4.1.0'

  s.add_development_dependency 'rake'
end
