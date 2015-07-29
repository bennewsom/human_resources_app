module LeaveTotalsHelper
    def remaining_annual_leave(employee, leave_totals)
        annual_leave_total = 0
        leave_totals.each do |leave_total|
            annual_leave_total = annual_leave_total + leave_total.annual_leave
        end
        @employee.annual_leave_allowance - annual_leave_total
    end
    
    def remaining_sick_leave(employee, leave_totals)
        sick_leave_total = 0
        leave_totals.each do |leave_total|
            sick_leave_total = sick_leave_total + leave_total.sick_leave
        end
        @employee.sick_leave_allowance - sick_leave_total
    end
    
    def remaining_other_leave(employee, leave_totals)
        other_leave_total = 0
        leave_totals.each do |leave_total|
            other_leave_total = other_leave_total + leave_total.other_leave
        end
        @employee.other_leave_allowance - other_leave_total
    end
    
end
