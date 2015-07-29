class AddColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :annual_leave_allowance, :integer
    add_column :employees, :sick_leave_allowance, :integer
    add_column :employees, :other_leave_allowance, :integer
  end
end
