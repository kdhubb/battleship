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
    # Modify lower part of method to match
    # require 'pry'; binding.pry
    # ("A2".."D2").each_cons(ship.length) do |valid|
    #   vertical_placements << valid
    # end
    # ("A3".."D3").each_cons(ship.length) do |valid|
    #   vertical_placements << valid
    # end
    # ("A4".."D4").each_cons(ship.length) do |valid|
    #   vertical_placements << valid
    # end
    # vertical_placements
  end
end