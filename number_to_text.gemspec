# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_to_text/version'

Gem::Specification.new do |s|
  s.name          = 'number_to_text'
  s.version       = NumberToText::VERSION
  s.authors       = ['Ann-Christin Preuß', 'Jan Habermann']
  s.email         = ['jan@habermann24.com']

  s.summary       = 'TODO: Write a short summary, because Rubygems requires one.'
  s.description   = 'TODO: Write a longer description or delete this line.'
  s.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'activesupport', '>= 4.1.0'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'rake', '~> 10.0'
end
