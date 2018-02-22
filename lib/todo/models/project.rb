module Todo
  class Project < Sequel::Model
    many_to_many :tasks
  end
end
