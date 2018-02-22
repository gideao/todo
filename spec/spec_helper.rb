require 'bundler/setup'

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'dotenv'

Dotenv.load

require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

ENV['COVERAGE'] && SimpleCov.start do
  add_filter ['/.rvm/', '/.rbenv']
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'faker'
require 'fabrication'

require 'todo'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  Todo.configure do |c|
    c.db = ':memory:'
  end

  # TODO: migrate on start up only when doing test
  Todo.setup && Todo.migrate

  config.before(:example) do
    Todo.migrate
  end

  config.after(:example) do
    Todo.reset
  end

  Task = Todo::Task
  Tag = Todo::Tag
end
