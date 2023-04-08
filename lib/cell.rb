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

  def render(param = false)
    if param == false
      if !fired_upon?
        "."
      elsif empty? && fired_upon?
        "M"
      end
    elsif param == true
      if !fired_upon? && empty?
        "."
      elsif !fired_upon? && !empty?
        "S"
      elsif empty? && fired_upon?
        "M"
      end
    end
  end
end