class CreateLeaveTotals < ActiveRecord::Migration
  def change
    create_table :leave_totals do |t|
      t.float :annual_leave
      t.float :sick_leave
      t.float :other_leave
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
