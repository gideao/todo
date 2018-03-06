require 'thor'

module Todo
  class CLI < Thor
    ON_DATABASE_COMMANDS = %w[list add update delete].freeze

    def initialize(args = [], options = {}, config = {})
      super
      current_cmd = config[:current_command]
      Todo.setup if current_cmd && ON_DATABASE_COMMANDS.include?(current_cmd.name)
    end

    desc 'add TITLE', 'Create a task', aliases: 'a'
    method_option 'tags', type: :string, aliases: '-t'
    def add(title)
      require 'todo/cli/add'
      Add.new(options, title).run
    end

    desc 'list', 'List tasks', aliases: 'l'
    # method_option "project", :type => :string, :banner => ""
    method_option 'status', default: 'todo', aliases: '-s'
    method_option 'tags', type: :string, aliases: '-t'
    def list
      require 'todo/cli/list'
      List.new(options).run
    end

    desc 'update TASK_ID', 'Update a task', aliases: 'u'
    method_option 'status', type: :string, aliases: '-s'
    def update(id)
      require 'todo/cli/update'
      Update.new(options, id).run
    end

    desc 'init', 'Create default configurations', aliases: 'u'
    method_option 'db', type: :string, default: Todo::Config.new.db
    def init
      require 'todo/cli/init'
      Init.new(options).run
    end

    # desc "delete TASK_ID", "Delete a taks", :aliases => 'd'
    # def delete(id)
    #   require "todo/cli/delete"
    #   Delete.new(options, id).rum
    # end
  end
end
