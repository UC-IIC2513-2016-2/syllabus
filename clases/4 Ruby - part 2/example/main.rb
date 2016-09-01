require_relative 'pokemon/base'
require_relative 'pokemon/pikachu'

pikachu = Pokemon::Pikachu.new('Pikachu', 100, :electric, {x: 1, y: 1}, 50)
charmander = Pokemon::Base.new('Charmander', 100, :fire, {x: 1, y: 2}, 50)
charmander2 = Pokemon::Base.new('Charmander2', 100, :fire, {x: 1, y: 10}, 200)
charmander3 = Pokemon::Base.new('Charmander3', 100, :fire, {x: 1, y: 3}, 70)
pikachu.name = 'Raichu'
puts pikachu.class
puts charmander.class

pokemones = [charmander, charmander2, charmander3]
pikachu.search_and_attack_if(pokemones)

puts pikachu, charmander, charmander2, charmander3
