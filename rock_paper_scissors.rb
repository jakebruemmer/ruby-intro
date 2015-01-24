#! usr/bin/env ruby

# This file is a simple rock paper scissors game that relies on user input from the command line.

if __FILE__ == $0

	puts "How many rounds would you like to play?"
	number_of_rounds = gets.chomp.to_i

	while !number_of_rounds.is_a?(Integer)
		puts "How many rounds would you like to play?"
		number_of_rounds = gets.chomp.to_i
	end

	# Game logic is as follows:
	# 1 will be the value for rock
	# 2 will be the value for paper
	# 3 will be the value for scissors
	ties = 0
	player_wins = 0
	computer_wins = 0

	# This will be a "rotating" player, whose choice will change throughout the rounds
	player_choice = 1
	# Iterate over the amount of rounds
	number_of_rounds.times do |round|

		# computer choice will be simulated through random number generation
		computer_choice = ((rand * 3) + 1).to_i

		# check for the win/loss condition
		if player_choice == computer_choice
			ties += 1
		elsif player_choice == 1
			# All possibilites if the rotating player plays a rock
			if computer_choice == 2
				# Computer chooses paper, wins.
				computer_wins += 1
			end
			if computer_choice == 3
				# Computer chooses scissors, loses.
				player_wins += 1
			end
		elsif player_choice == 2
			if computer_choice == 1
				# Computer chooses rock, loses.
				player_wins += 1
			end
			if computer_choice == 3
				# Computer chooses scissors, wins.
			end
		elsif player_choice == 3
			if computer_choice == 1
				# Computer plays rock, wins.
				computer_wins += 1
			end
			if computer_choice == 2
				# Computer plays paper, loses.
				player_wins += 1
			end
		end
	end

	check = ties + player_wins + computer_wins
	puts "Rotating player has won #{player_wins} times."
	puts "Computer (random) player has won #{computer_wins} times."
	puts "There were #{ties} ties."
	puts "#{player_wins} + #{computer_wins} + #{ties} = #{check}"
	puts "Game was played a total of #{number_of_rounds} times."
end
