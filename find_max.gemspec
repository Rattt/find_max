lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'find_max/version'

Gem::Specification.new do |spec|
  spec.name          = 'find_max'
  spec.version       = FindMax::VERSION
  spec.authors       = ['Ivan Moroz']
  spec.email         = ['Genom-1990@yandex.ru']

  spec.summary       = 'Test'
  spec.description   = 'find max numbers from file'
  spec.homepage      = 'https://github.com/Rattt/find_max'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'colorize', '0.8.1'
  spec.add_dependency 'i18n', '0.9.1'
  spec.add_dependency 'immutable-ruby', '0.0.2'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'rspec', '3.5.0'
  spec.add_development_dependency 'rspec-command', '1.0.1'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'
end
