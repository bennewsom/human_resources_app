class ModifyEmployeesSuperAndTaxDecTypes < ActiveRecord::Migration
  def change
    change_column :employees, :super_form,  :string
    change_column :employees, :tax_dec_form,  :string
  end
end
