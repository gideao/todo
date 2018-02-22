require 'todo/version'
require 'sequel'

Sequel.extension :migration

module Todo
  autoload :Config, 'todo/config'
  autoload :Tag, 'todo/models/tag'
  autoload :Task, 'todo/models/task'

  class << self
    def configure
      yield @settings
    end

    def setup
      yield @settings if block_given?
      raise Todo.settings.errors.first.to_s unless @settings.valid?
      @db = Sequel.sqlite(@settings.db)
    end

    def migrate(db = @db)
      Sequel::Migrator.run(db, File.join(__dir__, 'todo/migrations'))
    end

    def reset(db = @db)
      Sequel::Migrator.run(db, File.join(__dir__, 'todo/migrations'), target: 0)
    end
  end

  @settings = Config.new
end
