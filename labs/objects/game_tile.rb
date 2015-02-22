#! usr/bin/env ruby

# An object oriented take on the minesweeper game that's done in 131.
# Since it is un-Rubylike to use 2d arrays, I'm going to try and 
# make the game using a more object oriented approach.

class GameTile

  attr_accessor :adjacent, :adjacent_bombs, :been_played

  def initialize(up_left, up, up_right, left, right, down_left, down, down_right, is_bomb)
    @adjacent = {
      "up_left" => up_left,
      "up" => up,
      "up_right" => up_right,
      "left" => left,
      "right" => right,
      "down_left" => down_left,
      "down" => down,
      "down_right" => down_right
    }
    @is_bomb = is_bomb
    @adjacent_bombs = 0
    @been_played = false
  end

  # Method will iterate through the surrounding GameTiles to check how many bombs there are.
  # The method returns the number of bombs that are adjacent to itself.
  def find_adjacent_bombs
    @adjacent.each do |key, value|
      if value.is_bomb?
        @adjacent_bombs += 1
      end
    end
  end

  def is_bomb?
    @is_bomb
  end

end

