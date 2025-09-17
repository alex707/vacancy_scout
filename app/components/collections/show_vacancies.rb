class Collections::ShowVacancies
  def initialize(collection_id)
    @collection_id = collection_id
  end

  def call
    collection = Collection[@collection_id]

    collection.vacancies.inlcludes(:emplyers)
  end
end
