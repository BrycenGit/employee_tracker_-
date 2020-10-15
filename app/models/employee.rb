class Employee < ApplicationRecord
  validates :name, presence: true
  has_one :division_employee
  has_one :division, :through => :division_employee
  has_many :employee_projects
  has_many :projects, :through => :employee_projects
end