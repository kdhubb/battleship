# require "./lib/game"
require "./spec/spec_helper"

game = Game.new(player = Player.new, computer = Computer.new)
game.start