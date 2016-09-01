require_relative 'electric_attacks'

module Pokemon
  class Pikachu < Base
    include ElectricAttacks
  end
end
