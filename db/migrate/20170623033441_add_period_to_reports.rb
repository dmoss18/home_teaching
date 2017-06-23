class AddPeriodToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :period, :date, null: false, default: Date.today
  end
end
