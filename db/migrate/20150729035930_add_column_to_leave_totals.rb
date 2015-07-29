class AddColumnToLeaveTotals < ActiveRecord::Migration
  def change
     add_column :leave_totals, :reasons_for_leave, :string
  end
end
