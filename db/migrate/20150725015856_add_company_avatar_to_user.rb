class AddCompanyAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_avatar, :string
  end
end
