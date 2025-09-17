class Vacancies::Create
  def initialize(attrs)
    attrs['hhru_id'] = attrs['id']

    attrs['employer_hhru_id'] = attrs['employer']['id']
    attrs['employer_id'] = Employer.where(hhru_id: attrs['employer_hhru_id']).first.id

    attrs['area'] = attrs['area']['name']

    attrs['salary_from'] = attrs['salary_range'].try(:[], 'from')
    attrs['salary_to'] = attrs['salary_range'].try(:[], 'to')
    attrs['salary_currency'] = attrs['salary_range'].try(:[], 'currency')

    attrs['experience'] = attrs['experience']['id']
    attrs['employment_form'] = attrs['employment_form']['id']
    attrs['key_skills'] = Array(attrs['key_skills'].map { _1['name'] })
    attrs['work_format'] = Array(attrs['work_format'].map { _1['id'] })
    attrs['professional_roles'] = Array(attrs['professional_roles'].map { _1['name'] })
    attrs['created_at'] = Time.now
    attrs['updated_at'] = Time.now

    attrs.slice!(*%w[employer_id hhru_id name description area experience employment_form salary_from salary_to salary_currency work_format professional_roles key_skills created_at updated_at])

    @attrs = attrs
  end

  def call
    vacancy = Vacancy.new(**@attrs)

    vacancy.save

    vacancy
  end
end
