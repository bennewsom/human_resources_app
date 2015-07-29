class AddCompanyAvatarToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :company_avatar, :string
  end
end
