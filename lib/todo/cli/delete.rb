module Todo
  class CLI::Delete
    def initialize(_options, id)
      @id = id
    end

    def run
      Task.where(id: @id).delete
    end
  end
end
