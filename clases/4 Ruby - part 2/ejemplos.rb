module Debug
  def whoisthis
    puts "#{self.class.name} with id #{self.object_id}"
  end
end

class Dog
  include Debug
  attr_accessor :name, :breed
  def initialize(*args)
    @name, @breed = args
  end

  def bark
    puts 'woof!'
  end

  def bury(**things, &block)
    things.each do |thing, place|
      puts "Burying #{thing} in #{place}…" if !block || block.call(thing)
    end
  end

end

fido = Dog.new('Fido')
fido.bark
condition = -> (thing) { thing.to_s.start_with?('h') }
fido.bury(hueso: 'patio', juguete: 'living') { |thing| thing.to_s.start_with?('h') }
fido.whoisthis
puts fido.name
