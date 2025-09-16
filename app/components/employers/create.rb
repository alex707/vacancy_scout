class Employers::Create
  def initialize(attrs)
    attrs['hhru_id'] = attrs['id']
    attrs['area'] = attrs['area']['name']
    attrs['industry_type'] = attrs['industries'].map { _1['name'] }.join(?,)
    attrs['created_at'] = Time.now
    attrs['updated_at'] = Time.now

    attrs.slice!(*%w[hhru_id description name industry_type site_url area created_at updated_at])

    @attrs = attrs
  end

  def call
    employer = Employer.new(**@attrs)

    employer.save

    employer
  end
end
