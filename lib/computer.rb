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

  def vertical_valid_placement(ship)
    vertical_placements = []
    ("A".."D").each_cons(ship.length) do |array|
      array.map! do |letter|
        letter.ljust(2, "1")
      end
      vertical_placements << array
    end
    ("A".."D").each_cons(ship.length) do |array|
      array.map! do |letter|
        letter.ljust(2, "2")
      end
      vertical_placements << array
    end
    ("A".."D").each_cons(ship.length) do |array|
      array.map! do |letter|
        letter.ljust(2, "3")
      end
      vertical_placements << array
    end
    ("A".."D").each_cons(ship.length) do |array|
      array.map! do |letter|
        letter.ljust(2, "4")
      end
      vertical_placements << array
    end
    vertical_placements
  end
end