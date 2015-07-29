class LeaveTotal < ActiveRecord::Base
    belongs_to :employee
    validates :annual_leave, :sick_leave, :other_leave, :reasons_for_leave, :date_leave_requested, presence: true
end
