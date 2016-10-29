class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.boolean :will_vote
      t.boolean :voted_past_election
      t.integer :politics_satisfaction
      t.references :municipality, foreign_key: true
      t.references :preferred_candidate, foreign_key: { to_table: :candidates }

      t.timestamps
    end
  end
end
