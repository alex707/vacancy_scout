Sequel.migration do
  change do
    create_table(:vacancies) do
      primary_key :id
      foreign_key :employer_id, index: true, on_delete: :cascade
      Bignum :hhru_id, index: {unique: true}
      String :name
      String :description
      String :area
      String :experience
      String :employment_form
      Bignum :salary_from
      Bignum :salary_to
      String :salary_currency
      column :work_format, 'text[]'
      column :professional_roles, 'text[]'
      column :key_skills, 'text[]'
      DateTime :created_at, null: false, index: true
      DateTime :updated_at, null: false
    end
  end
end
