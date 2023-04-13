class Turn
  def render_boards(computer, player, param = false)
    "\n============COMPUTER BOARD============ \n" +
    computer.board.render(true) +
    "\n=============PLAYER BOARD============= \n" +
    player.board.render(true)
  end

  def computer_fire(computer, player)
    computer.computer_shot(player)
  end
  
  def player_fire(player, computer, input)
    if computer.board.valid_coordinate?(input) && !computer.board.cells[input].fired_upon?
        computer.board.cells[input].fire_upon
        player_result = computer.board.cells[input].render_result
        computer_result = player.board.cells[computer.cells_fired_upon.last].render_result
        puts "\nYour shot on #{input} #{player_result}. \n" +
        "\nMy shot on #{computer.cells_fired_upon.last} #{computer_result}. \n"
    elsif !computer.board.valid_coordinate?(input)
      puts "\nYou're off the charts! Please enter a valid coordinate that is on the board:\n"
    elsif computer.board.cells[input].fired_upon?
      puts "\nYou already shot there! Try again:\n"
    end
  end
end