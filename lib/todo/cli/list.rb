require 'tty-table'

module Todo
  class CLI::List
    def initialize(options)
      @status = options[:status]
      @tags = options[:tags].split(',') if options[:tags]
      @project = options[:project]

      if options[:tags]
        tags = options[:tags].split(',')
        @tags = Tag.where(name: tags)
      end

      @status = nil if @status == 'any'
    end

    def run
      filter = { status: @status, project: @project, tags: @tags }.compact

      tasks = Task.where(filter).eager(:tags).map do |task|
        tags = task.tags.map(&:name).join(',')
        [task.id, task.status, task.title, tags]
      end

      if tasks.empty?
        puts 'Nothing found!'
      else
        table = TTY::Table.new %w[id status title tags], tasks
        puts table.render(:unicode, indent: 1, padding: [0, 1])
      end
    end
  end
end
