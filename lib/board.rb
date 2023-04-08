class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    validated_coordinates?(ship, coordinates) == false && ship.length == coordinates.length && (horizontal_valid?(ship, coordinates) || vertical_valid?(ship, coordinates))
  end

  def validated_coordinates?(ship, coordinates)
    return_array = []
    coordinates.each do |coordinate|
      return_array << valid_coordinate?(coordinate)
    end
    return_array.any?(false)
  end

  def horizontal_valid?(ship, coordinates)
    con_coords = []
    (coordinates[0]..coordinates[0].slice(0) + "4").each_cons(ship.length) do |coordinate|
      con_coords << coordinate
    end
    con_coords[0] == coordinates
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