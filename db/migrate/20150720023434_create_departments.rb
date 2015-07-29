class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_name, null: false
      t.integer :company_id

      t.timestamps null: false
    end
    add_index :departments, :company_id
  end
end
