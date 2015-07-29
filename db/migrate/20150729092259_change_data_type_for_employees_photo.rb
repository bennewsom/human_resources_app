class ChangeDataTypeForEmployeesPhoto < ActiveRecord::Migration
  def change
    change_column :employees, :employee_photo,  :string
  end
end
