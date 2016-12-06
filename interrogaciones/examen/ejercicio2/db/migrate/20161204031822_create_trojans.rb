class CreateTrojans < ActiveRecord::Migration[5.0]
  def change
    create_table :trojans do |t|
      t.string :name

      t.timestamps
    end
  end
end
