Sequel.migration do
  up do
    create_table(:tags) do
      primary_key :id
      String :name, null: false
    end

    create_join_table(tag_id: :tags, task_id: :tasks)
  end

  down do
    drop_table(:tags_tasks)
    drop_table(:tags)
  end
end
