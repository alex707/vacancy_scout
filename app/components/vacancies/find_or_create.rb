class Vacancies::FindOrCreate
  def initialize(attrs)
    @attrs = attrs

    @attrs['employer_id'] = employer.id

    @attrs
  end

  def call
    return vacancy if vacancy

    Vacancies::Create.new(vacancy_data).call
  end

  private

  def vacancy
    @vacancy ||= Vacancy.where(hhru_id: @attrs['id']).first
  end

  def vacancy_data
    @vacancy_data ||= HeadHunterClient.new.get_vacancy_data(@attrs['id'])
  end

  def employer
    @employer ||= Employers::FindOrCreate.new(@attrs['employer']).call
  end
end
