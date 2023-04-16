class Computer
  attr_reader :board,
              :cruiser,
              :submarine,
              :cells_fired_upon
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser_coords = nil
    @submarine_coords = nil
    @cells_fired_upon = []
  end

  def ship_placement
    random_ship_coords
    @board.place(@cruiser, @cruiser_coords)
    @board.place(@submarine, @submarine_coords)
  end
# debugged the following method after project due date:
  def random_ship_coords
    @cruiser_coords = all_valid_placements(@cruiser).sample
    submarine_coords_all = all_valid_placements(@submarine)
    remaining_sub_placs0 = submarine_coords_all.delete_if do |submarine_coord|
      submarine_coord.include?(@cruiser_coords[0])
    end
    remaining_sub_placs1 = remaining_sub_placs0.delete_if do |submarine_coord|
      submarine_coord.include?(@cruiser_coords[1])
    end
    remaining_sub_placs2 = remaining_sub_placs1.delete_if do |submarine_coord|
      submarine_coord.include?(@cruiser_coords[2])
    end
    @submarine_coords = remaining_sub_placs2.sample
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
      array.map! do |letter|
          letter.ljust(2, "2")
      end
      vertical_placements << array
      array.map! do |letter|
        letter.ljust(2, "3")
      end
      vertical_placements << array
      array.map! do |letter|
        letter.ljust(2, "4")
      end
      vertical_placements << array
    end
    vertical_placements
  end

  def cell_to_fire_at(player)
    available_cells = []
    player.board.cells.select do |input, status|
      status.fired_upon? == false
      available_cells << input
    end
    available_cells.sample
  end

  def computer_shot(player)
    cell_shot = cell_to_fire_at(player)
    player.board.cells[cell_shot].fire_upon
    @cells_fired_upon << cell_shot
  end
end