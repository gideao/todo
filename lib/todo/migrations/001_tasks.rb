Sequel.migration do
  up do
    create_table(:tasks) do
      primary_key :id
      String :title, null: false
      String :status, null: false, default: 'todo'
    end
  end

  down do
    drop_table(:tasks)
  end
end
