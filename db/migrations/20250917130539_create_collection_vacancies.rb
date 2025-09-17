Sequel.migration do
  change do
    create_table(:collection_vacancies) do
      primary_key :id
      foreign_key :collection_id, null: false, index: true
      foreign_key :vacancy_id, null: false, index: true

      unique %i[collection_id vacancy_id]

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
