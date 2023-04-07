class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if @ship != nil
      @ship.health != @ship.length
    else
      false
    end
  end

  def fire_upon
    @ship.hit if @ship != nil
  end

  def render
    if @ship == nil
      "."
    end
  end
end