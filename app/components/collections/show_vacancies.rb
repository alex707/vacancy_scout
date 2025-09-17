class Collections::ShowVacancies
  def initialize(collection_id)
    @collection_id = collection_id
  end

  def call
    collection = Collection[@collection_id]

    collection.vacancies.map do |vacancy|
      employer = vacancy.employer
      {vacancy_name: vacancy.name, employer_name: employer.name}
    end
  end
end
