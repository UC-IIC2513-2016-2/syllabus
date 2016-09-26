# I1 - IIC2513

# Pregunta 2.1:
class PossibleMigrations < ActiveRecord::Migration[5.0]

  def change
    create_table :races do |t|
      t.string :name, null: false
      t.integer :max_participants, null: false
      t.float :distance, null: false
      t.boolean :finished, default: false
    end

    create_table :snails do |t|
      t.string :name, null: false
      t.integer :speed, null: false
    end

    create_table :snail_race_participations do |t|
      t.references :snail, index: true
      t.references :race, index: true
      t.boolean :sleeping, default: false
      t.float :distance, null: false, default: 0
    end

    create_table :race_ticks do |t|
      t.references :race, index: true
      t.float :average_distance, null: false
    end
  end
end

# Pregunta 2.2:
class Race < ApplicationRecord
  has_many :snail_race_participations

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :max_participants, presence: true, numericality: { greater_than: 2 }
  validates :distance, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
end

class Snail < ApplicationRecord
  has_many :snail_race_participations

  validates :name, presence: true, length: { minimum: 5 }
  validates :speed, presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end

class SnailRaceParticipation < ApplicationRecord
  belongs_to :race
  belongs_to :snail

  validates :distance, presence: true, numericality: true
end

class RaceTick < ApplicationRecord
  belongs_to :race

  validates :average_distance, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
end
