class CreateItLicences < ActiveRecord::Migration
  def change
    create_table :it_licences do |t|
      t.string :licence_provider
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
