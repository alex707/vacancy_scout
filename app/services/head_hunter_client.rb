class HeadHunterClient
  def get_employer_data(employer_hh_id)
    link = File.join(HH_URL, 'employers', employer_hh_id.to_s)

    response = HTTPX.get(link)

    JSON.parse(response.body.to_s) if response.status == 200
  end

  def get_vacancy_data(vacancy_hh_id)
    link = File.join(HH_URL, 'vacancies', vacancy_hh_id.to_s)

    response = HTTPX.get(link)

    JSON.parse(response.body.to_s) if response.status == 200
  end

  def get_vacancies_data(params)
    link = File.join(HH_URL, 'vacancies')

    response = HTTPX.get(link, params: params)

    JSON.parse(response.body.to_s) if response.status == 200
  end
end
