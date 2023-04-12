class Turn

  def render_boards(computer, player, param = false)
    board = "============COMPUTER BOARD============ \n" +
    computer.board.render(param) +
    "=============PLAYER BOARD============= \n" +
    player.board.render(param)
    puts board
  end

  def computer_fire(computer, player)
    computer.computer_shot(player)
  end

  def player_fire(computer, input)
    computer.board.cells[input].fire_upon
    "Your shot on #{input} was a miss. \n" +
    "My shot on C1 was a miss. \n"
  end

  def results
   
  end

end