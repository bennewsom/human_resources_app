class Employee < ActiveRecord::Base
    has_many :it_licences, through: :departments
    has_many :leave_totals
    belongs_to :department
end
