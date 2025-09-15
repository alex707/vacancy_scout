# documentation available at http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    create_table(:employers) do
      primary_key :id
      Bignum :hhru_id, index: {unique: true}
      String :description
      String :industry_type
      String :site_url
      String :area
    end
  end
end
