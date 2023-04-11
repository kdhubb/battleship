class Computer
  attr_reader :board,
              :cruiser,
              :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser_placement = nil
    @submarine_placement = nil
  end

  def random_ship_placement
    @cruiser_placement = all_valid_placements(@cruiser).sample
    submarine_placements_all = all_valid_placements(@submarine)
    remaining_sub_placs = submarine_placements_all.delete_if do |submarine_placement|
      submarine_placement.include?(@cruiser_placement[0] || @cruiser_placement[1] || @cruiser_placement[2])
    end
    @submarine_placement = remaining_sub_placs.sample
    require 'pry'; binding.pry
  end

  def all_valid_placements(ship)
    valid_placements = []
    valid_placements << horizontal_valid_placement(ship)
    valid_placements << vertical_valid_placement(ship)
    valid_placements.flatten!(1)
    valid_placements
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