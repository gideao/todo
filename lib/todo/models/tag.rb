module Todo
  class Tag < Sequel::Model
    many_to_many :tasks
  end
end
