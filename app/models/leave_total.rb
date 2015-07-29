class LeaveTotal < ActiveRecord::Base
    belongs_to :employee
    validates :reasons_for_leave, :date_leave_requested, presence: true
end
