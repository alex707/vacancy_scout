class Vacancy < Sequel::Model
  many_to_one :employer
end
