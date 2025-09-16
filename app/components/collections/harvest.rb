class Collections::Harvest
  def initialize(collection_id)
    @collection_id = collection_id
  end

  def call
    collection = Collection[@collection_id]

    query_params = collection.parameters
    query_params['page'] = 0

    @pages = nil

    # ["items", "found", "pages", "page", "per_page", "clusters", "arguments", "fixes", "suggests", "alternate_url"]
    response = HeadHunterClient.new.get_vacancies_data(query_params)

    @pages ||= response['pages'].to_i

    puts "\ncollection_id: #{collection.id}, query_params: #{query_params}"
    (0...@pages).to_a.each do |current_page|
      response['items'].each do |vacancy_data|
        Vacancies::FindOrCreate.new(vacancy_data).call
      end

      query_params['page'] = current_page + 1
      if query_params['page'] < @pages
        puts "collection_id: #{collection.id}, query_params: #{query_params}"
        response = HeadHunterClient.new.get_vacancies_data(query_params)
      end
    end
  end
end
