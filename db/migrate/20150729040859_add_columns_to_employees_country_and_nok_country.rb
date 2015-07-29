class AddColumnsToEmployeesCountryAndNokCountry < ActiveRecord::Migration
  def change
     add_column :employees, :country, :string
     add_column :employees, :nok_country, :string
  end
end
