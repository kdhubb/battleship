class Turn

  def render_boards(computer, player, param = false)
    "============COMPUTER BOARD============ \n" +
    computer.board.render(param) +
    "=============PLAYER BOARD============= \n" +
    player.board.render(true)
  end

  def computer_fire(computer, player)
    computer.computer_shot(player)
  end
# potentially move results into its own method keeping track of inputs, like computer fired upon.
  def player_fire(player, computer, input)
    if computer.board.valid_coordinate?(input)
        computer.board.cells[input].fire_upon
        player_result = computer.board.cells[input].render_result
        computer_result = player.board.cells[computer.cells_fired_upon.last].render_result
        "Your shot on #{input} #{player_result}. \n" +
        "My shot on #{computer.cells_fired_upon.last} #{computer_result}. \n"
    else
      "You're off the charts! Please enter a valid coordinate:"
    end
  end
end