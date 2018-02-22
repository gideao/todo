module Todo
  class CLI::Add
    def initialize(options, title)
      @title = title
      @tags = options[:tags] ? options[:tags].split(',') : []
    end

    def run
      title = @title
      tags = @tags
      task = Task.create(title: title, status: 'todo')

      tags.each do |t|
        tag = Tag.find(name: t) || Tag.create(name: t)
        task.add_tag(tag)
      end
    end
  end
end
