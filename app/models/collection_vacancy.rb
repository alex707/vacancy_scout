class CollectionVacancy < Sequel::Model
  many_to_one :collection
  many_to_one :vacancy
end
