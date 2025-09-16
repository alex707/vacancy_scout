class Employers::FindOrCreate
  def initialize(attrs)
    @attrs = attrs
  end

  def call
    return employer if employer

    Employers::Create.new(employer_data).call
  end

  private

  def employer
    @employer ||= Employer.where(hhru_id: @attrs['id']).first
  end

  def employer_data
    @employer_data ||= HeadHunterClient.new.get_employer_data(@attrs['id'])
  end
end
