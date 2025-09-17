class Collection < Sequel::Model
  one_to_many :collection_vacancies
  many_to_many :vacancies, join_table: :collection_vacancies
end
