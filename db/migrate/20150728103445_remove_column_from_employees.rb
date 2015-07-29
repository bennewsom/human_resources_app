class RemoveColumnFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :start_date
  end
end
