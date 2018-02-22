module Todo
  class Task < Sequel::Model
    many_to_many :tags
  end
end
