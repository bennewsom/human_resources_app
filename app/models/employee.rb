class Employee < ActiveRecord::Base
    #has_many :it_licences, through: :departments
    has_many :leave_totals
    belongs_to :department
    validates :first_name, :last_name, :position_title, :gender, :date_of_birth, :employee_hire_date, presence: true
    mount_uploader :employee_photo, EmployeeUploader
    mount_uploader :tax_dec_form, EmployeeUploader
    mount_uploader :super_form, EmployeeUploader
end
