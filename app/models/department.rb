class Department < ActiveRecord::Base
    has_many :employees
    has_many :leave_totals, :through => :employees
    belongs_to :company
    validates :department_name, presence: true
    
end
