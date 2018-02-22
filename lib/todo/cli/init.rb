module Todo
  class CLI
    class Init
      def initialize(options)
        @db = options[:db]
      end

      def run
        # config = File.expand_path('../../config.yml', __dir__)
        # FileUtils.mkpath(File.dirname(path))
        # FileUtils.cp(config, path)

        FileUtils.mkpath(File.dirname(@db))
        db = Sequel.sqlite(@db)
        Todo.migrate(db)
      end
    end
  end
end
