class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :assignment
      t.text :message
      t.string :status
      t.string :household_name
      t.timestamps
    end
  end
end
