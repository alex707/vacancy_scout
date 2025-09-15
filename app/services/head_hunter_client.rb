class HeadHunterClient
  def get_employer_data(employer_hh_id)
    link = File.join(HH_URL, 'employers', employer_hh_id.to_s)

    response = HTTPX.get(link)

    JSON.parse(response.body.to_s) if response.status == 200
  end
end
