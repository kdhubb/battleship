require "./lib/renderables"

class Cell
  include Renderables

  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    if !empty?
      @ship.hit 
    end
    @fired_upon = true
  end
end