class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !empty?
      @ship.hit 
    end
    @fired_upon = true
  end

  def render
    if empty? && self.fired_upon? == false
      "."
    elsif empty? && self.fired_upon? == true
      "M"
    end
  end
end