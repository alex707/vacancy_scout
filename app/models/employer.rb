class Employer < Sequel::Model
  one_to_many :vacancies

  add_association_dependencies vacancies: :destroy
end
