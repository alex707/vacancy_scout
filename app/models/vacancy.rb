class Vacancy < Sequel::Model
  many_to_one :employer

  one_to_many :collection_vacancies
  many_to_many :collections, join_table: :collection_vacancies
end
