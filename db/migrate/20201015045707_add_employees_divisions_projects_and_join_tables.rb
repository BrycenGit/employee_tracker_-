class AddEmployeesDivisionsProjectsAndJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.timestamps
    end

    create_table :employees do |t|
      t.string :name
      t.timestamps
    end

    create_table :projects do |t|
      t.string :name
      t.string :desciption
      t.timestamps
    end

    create_table :division_employees do |t|
      t.belongs_to :division, index: true
      t.belongs_to :employee, index: true
      t.timestamps
    end

    create_table :employee_projects do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
