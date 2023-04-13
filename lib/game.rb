## Anywhere there is text, add line breaks so that instructions don't get lost
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
    puts "Welcome to BATTLESHIP\n" +
    "Enter p to play. Enter q to quit."
    start_response = gets.downcase.chomp 
    if start_response == "p"
      setup
    elsif start_response == "q"
      puts "Thanks for playing"
    else
      start
    end
  end

  def setup
    @computer.ship_placement
    puts "I have laid out my ships on the grid.\n" +
    "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render(true)
    player_cruiser_placement
  end
  
  def player_cruiser_placement
    puts "Enter the squares for the Cruiser (3 spaces):"
    # Give more explicit instructions ^ on what valid coordinates look lik
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.cruiser, raw_input)
      @player.board.place(@player.cruiser, raw_input)
      puts @player.board.render(true)
      player_submarine_placement
    else
      puts "You must enter valid coordinates"
      # Give more explicit instructions ^ on what valid coordinates look lik
      player_cruiser_placement
    end
  end
  
  def player_submarine_placement
    puts "Enter the squares for the Submarine (2 spaces):"
    # Give more explicit instructions ^ on what valid coordinates look lik
    raw_input = gets.upcase.split(" ")
    if @player.board.valid_placement?(@player.submarine, raw_input)
      @player.board.place(@player.submarine, raw_input)
      puts @player.board.render(true)
      begin_firing
    else
      puts "You must enter valid coordinates"
      # Give more explicit instructions ^ on what valid coordinates look lik
      player_submarine_placement
    end
  end

  def begin_firing
    @turn = Turn.new
    puts @turn.render_boards(@computer, @player)
    puts "Enter the coordinate for your shot:"
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
      puts "You lost! Computer was the winner!"
      #sleep to delay to next start of game?
      start
    elsif (@computer.cruiser.sunk? && @computer.submarine.sunk?)
      puts "You won!"
      #sleep to delay to next start of game?
      start
    else
      begin_firing
    end
  end
end