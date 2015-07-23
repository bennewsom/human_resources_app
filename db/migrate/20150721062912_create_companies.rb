class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :compname

      t.timestamps null: false
    end
  end
end
