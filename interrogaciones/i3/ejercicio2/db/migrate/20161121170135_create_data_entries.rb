class CreateDataEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :data_entries do |t|
      t.float :temperature, null: false
      t.string :temperature_unit, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.float :altitude, null: false
      t.boolean :outside, default: false
      t.string :notes

      t.timestamps
    end
  end
end
