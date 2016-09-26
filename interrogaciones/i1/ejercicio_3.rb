class RaceManager

  def initialize(race_id)
    @race = Race.find(race_id)
  end

  # Simula un tick si la carrera no ha terminado.
  # Retorna boolean indicando si la carrera está o no terminada.
  def simulate
    return true if @race.finished
    # simulamos un tick
    participations = @race.active_participations
    total_distance = 0
    someone_won = false
    participations.each do |participation|
      distance = participation.snail.speed * rand
      total_distance += distance
      participation.distance += distance
      someone_won = true if participation.distance >= race.distance
      participation.save
    end
    @race.race_ticks.create(average_distance: total_distance / participation.count)
    @race.finish! if someone_won
    @race.finished
  end

  def winners
    @race.winners if @race.finished
  end

  def leader
    @race.leader
  end
end

class Race < ActiveRecord::Base
  def active_participations
    snail_rance_paritipations.where(sleeping: false)
  end

  def winners
    snail_race_participations.where('distance > ?', self.distance).map(&:snail)
  end

  def leader
    snail_race_participations.order(distance: :desc).first.snail
  end

  def finish!
    update(finished: true)
  end
end

class RacesController < ApplicationController
  def tick
    race_manager = RaceManager.new(@race_id)
    if @race_manager.simulate
      @winners = @race_manager.winners
    else
      @leader = @race_manager.leader
    end
  end
end
