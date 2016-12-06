class CreateJournalEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :journal_entries do |t|
      t.string :text
      t.string :feeling
      t.datetime :timestamp
      t.string :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
