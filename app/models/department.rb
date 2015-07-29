class Department < ActiveRecord::Base
    belongs_to :company
    has_many :employees
    has_many :leave_totals, :through => :employees
    validates :department_name, presence: true
    
end
