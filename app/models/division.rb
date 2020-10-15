class Division < ApplicationRecord
  validates :name, presence: true
  has_many :division_employees
  has_many :employees, :through => :division_employees
end