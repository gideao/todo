module Todo
  class CLI::Update
    def initialize(options, id)
      @options = options
      @id = id
    end

    def run
      id = @id
      status = @options[:status]
      Task.where(id: id).update(status: status)
    end
  end
end
