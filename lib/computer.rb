class Computer
  attr_reader :board,
              :cruiser,
              :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def random_ship_placement

  end

  def horizontal_valid_placement(ship)
    horizontal_placements = []
    ("A1".."A4").each_cons(ship.length) do |valid|
      horizontal_placements << valid
    end
    ("B1".."B4").each_cons(ship.length) do |valid|
      horizontal_placements << valid
    end
    ("C1".."C4").each_cons(ship.length) do |valid|
      horizontal_placements << valid
    end
    ("D1".."D4").each_cons(ship.length) do |valid|
      horizontal_placements << valid
    end
    horizontal_placements
  end

  def vertical_valid?(ship, coordinates)
    con_coords = []
      (coordinates[0].slice(0).."D").each_cons(ship.length) do |coordinate|
        con_coords << coordinate
      end
      con_coords.map! do |coordinate|
        coordinate.map! do |coordinat|
          coordinat + coordinates[0].slice(1)
        end  
      end
    con_coords[0] == coordinates
  end
end