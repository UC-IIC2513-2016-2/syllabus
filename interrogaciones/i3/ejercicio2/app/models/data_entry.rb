class DataEntry < ApplicationRecord
  validates :temperature, :longitude, :latitude, :altitude,
    presence: true, numericality: { allow_blank: true }
  validates :temperature_unit, presence: true, inclusion: { in: %w(C F), allow_blank: true }
end
