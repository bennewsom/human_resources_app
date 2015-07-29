class AddColumnToLeaveTotal < ActiveRecord::Migration
  def change
    add_column :leave_totals, :date_leave_requested, :date
  end
end
