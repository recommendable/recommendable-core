$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'recommendable/core/version'

Gem::Specification.new do |s|
  s.name          = 'recommendable-core'
  s.version       = Recommendable::Core::VERSION
  s.authors       = ['David Celis']
  s.email         = ['me@davidcel.is']
  s.homepage      = 'https://github.com/recommendable/recommendable-core'
  s.license       = 'MIT'

  s.summary       = 'A Like/Dislike recommendation engine for Ruby apps.'
  s.description   = <<-DESCRIPTION.gsub(/^\s{4}/, '')
    Recommendable is a recommendation engine for Ruby applications using a
    rating system based on likes and dislikes. Recommendable::Core defines the
    interface and main functionality of the Recommendable ecosystem, but can
    still be used on its own. To pair Recommendable with plugins that define a
    persistence layer or alter how recommendations are generated, see
    https://github.com/recommendable.
  DESCRIPTION

  s.require_paths = ['lib']

  s.files         = Dir['lib/**/*.rb']
  s.test_files    = Dir['spec/**/*.rb']

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'rspec', '~> 3.0'
end
