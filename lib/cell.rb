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
# add a test for render result
  def render_result
    if fired_upon? && !empty? && @ship.sunk?
      "sunk my ship"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "was a hit"
    elsif empty? && fired_upon?
      "was a miss"
    end
  end
end