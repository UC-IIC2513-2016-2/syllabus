require_relative '../distance'

module Pokemon
  class Base
    attr_accessor :name
    attr_reader :hp
    attr_reader :cp
    attr_reader :position
    attr_reader :type

    def initialize(name, hp, type, position, cp)
      @name, @hp, @type, @position, @cp = name, hp, type, position, cp
    end

    def receive_attack(damage)
      @hp -= damage
    end

    def attack(pokemon, damage)
      pokemon.receive_attack(damage)
    end

    def search_and_attack_if(pokemons)
      pokemons.each do |pokemon|
        if Distance.manhattan(self.position, pokemon.position) < 4
          if !block_given? || yield(pokemon)
            self.attack(pokemon, 10)
          end
        end
      end
    end

    def to_s
      "#{self.name}: #{self.hp}"
    end

  end
end
