class DivisionEmployee < ApplicationRecord
  belongs_to :division
  belongs_to :employee
end