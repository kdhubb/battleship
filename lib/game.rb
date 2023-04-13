class Game
attr_reader :player, 
            :computer
  def initialize
    @player = nil
    @computer = nil
    @turn = nil
  end

  def new_players
    @player = Player.new
    @computer = Computer.new
  end
  
  def start
    new_players
    puts "
                  __/___     |>
                /_____/_____|_
        _______/_____/_______|_____
        \\   USS  < < <  TURING   ||
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~~~~~~~~~~~~~~~~ Welcome to ~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
    "   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
    "  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
    "  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
    "  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
    "  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\nEnter p to play. Enter q to quit."
    start_response = gets.downcase.chomp 
    if start_response == "p"
      setup
    elsif start_response == "q"
      puts "\n Thanks for playing \n"
    else
      start
    end
  end

  def setup
    @computer.ship_placement
    puts "\n I have laid out my ships on the grid. \n" +
    "\n You now need to lay out your two ships. \n" +
    "\n The Cruiser is three units long and the Submarine is two units long. \n"
    puts @player.board.render(true)
    player_cruiser_placement
  end
  
  def player_cruiser_placement
    puts "\n Enter the squares for the Cruiser (eg, A1 B1 C1): \n"
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.cruiser, raw_input)
      @player.board.place(@player.cruiser, raw_input)
      puts @player.board.render(true)
      player_submarine_placement
    else
      puts "\n You must enter valid coordinates (eg, A1 B1 C1) \n"
      player_cruiser_placement
    end
  end
  
  def player_submarine_placement
    puts "\n Enter the squares for the Submarine (eg, A1 B1): \n"
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.submarine, raw_input)
      @player.board.place(@player.submarine, raw_input)
      puts @player.board.render(true)
      begin_firing
    else
      puts "\n You must enter valid coordinates (eg, A1 B1) \n"
      player_submarine_placement
    end
  end

  def begin_firing
    @turn = Turn.new
    puts @turn.render_boards(@computer, @player)
    puts "\n Enter the coordinate for your shot: \n"
    shot_input = gets.chomp.upcase
    if @computer.board.valid_coordinate?(shot_input)
      @turn.computer_fire(@computer, @player)
      @turn.player_fire(@player, @computer, shot_input)
      winner
    elsif !@computer.board.valid_coordinate?(shot_input) || @computer.board.cells[shot_input].fired_upon?
      @turn.player_fire(@player, @computer, shot_input)
      begin_firing
    end
  end

  def winner
    if (@player.cruiser.sunk? && @player.submarine.sunk?) 
      puts "\n You lost! Computer was the winner! \n"
      sleep(2)
      start
    elsif (@computer.cruiser.sunk? && @computer.submarine.sunk?)
      puts "\n You won! \n"
      sleep(2)
      start
    else
      begin_firing
    end
  end
end