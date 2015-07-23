class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_name
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
