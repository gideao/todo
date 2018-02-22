
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo/version'

Gem::Specification.new do |spec|
  spec.name          = 'todo'
  spec.version       = Todo::VERSION
  spec.authors       = ['Gideao Santana']
  spec.email         = ['hello@gideao.co']

  spec.summary       = "A poor man's task manager."
  spec.description   = 'A simple task manager that support task, project andtags. '
  spec.homepage      = 'https://github.com/gideao/todo'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sequel', '~> 5.5'
  spec.add_runtime_dependency 'sqlite3', '~> 1.3'
  spec.add_runtime_dependency 'thor', '~> 0.20'
  spec.add_runtime_dependency 'tty-table', '~> 0.9'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'dotenv', '>= 0'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'faker', '~> 1.8'
  spec.add_development_dependency 'fabrication', '~> 2.20'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'rufo', '>= 0'
  spec.add_development_dependency 'simplecov', '>= 0'
end
