Sequel.migration do
  change do
    create_table(:collections) do
      primary_key :id
      String :name, null: false
      column :parameters, :jsonb, default: '{}'
      DateTime :created_at, null: false, index: true
      DateTime :updated_at, null: false
    end
  end
end
