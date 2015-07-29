class Company < ActiveRecord::Base
    has_many :users
    has_many :departments
    has_many :employees, through: :departments
    validates :company_name, presence: true
    #validates_presence_of :company_avatar, :content_type => /\Aimage\/.*\Z/
    mount_uploader :company_avatar, CompanyAvatarUploader
    
end