class CreateLeaveTotals < ActiveRecord::Migration
  def change
    create_table :leave_totals do |t|
      t.float :annual_leave, null: false
      t.float :sick_leave,   null: false
      t.float :other_leave,  null: false
      t.integer :employee_id

      t.timestamps null: false
    end
    #add_index :leave_totals, :company_id
    #add_index :leave_totals, :department_id
    add_index :leave_totals, :employee_id
  end
end
