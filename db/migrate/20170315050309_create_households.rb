class CreateHouseholds < ActiveRecord::Migration[5.0]
  def change
    create_table :households do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.references :ward, foreign_key: true

      t.timestamps
    end
  end
end
