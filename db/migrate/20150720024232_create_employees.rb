class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :start_date
      t.string :position_title, null: false
      t.string :gender, null: false
      t.date :date_of_birth, null: false
      t.string :address
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.integer :home_phone
      t.integer :mobile
      t.string :email
      t.integer :tax_file_number
      t.string :nok_name
      t.string :nok_relationship
      t.string :nok_address
      t.string :nok_suburb
      t.string :nok_state
      t.integer :nok_postcode
      t.integer :nok_home_phone
      t.integer :nok_mobile
      t.integer :nok_work_phone
      t.date :employee_hire_date, null: false
      t.string :employment_status
      t.float :annual_pay
      t.float :monthly_pay
      t.float :hourly_rate
      t.string :benefits
      t.string :bank_name
      t.string :bank_branch
      t.string :account_name
      t.integer :bsb_number
      t.integer :account_number
      t.boolean :tax_dec_form
      t.boolean :super_form
      t.boolean :it_licences
      t.boolean :employee_photo
      t.boolean :business_card
      t.integer :department_id

      t.timestamps null: false
    end
    #add_index :employees, :company_id
    add_index :employees, :department_id
  end
end
