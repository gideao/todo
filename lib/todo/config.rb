
module Todo
  class Config
    attr_accessor :config, :db
    attr_reader :errors

    def initialize(config: nil, db: nil)
      @config = config || File.join(Dir.home, '.config/todo/config.yml')
      @db = db || File.join(Dir.home, '.config/todo/db.sqlite')
      @errors = []
    end

    # Validates the configuration values
    # @return [Boolean]
    def valid?
      @errors.clear

      # unless File.exist?(@config)
      #   @errors << 'Configuration file not found!'
      # end

      if @db != ':memory:' && !File.exist?(@db)
        @errors << 'Database not found!'
      end

      @errors.empty?
    end

    def configure
      yield self
    end
  end
end
