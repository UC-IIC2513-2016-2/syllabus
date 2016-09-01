module Distance
  def self.manhattan(position, position2)
    (position[:x] - position2[:x]).abs + (position[:y] - position2[:y]).abs
  end
end
