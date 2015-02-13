import argparse, random

parser = argparse.ArgumentParser(description="Roll some dice!")

parser.add_argument('dice', metavar='--dice', type=int, nargs='+', help='The number of dice to roll')

parser.add_argument('rolls', metavar='--rolls', type=int, nargs='+', help='The number of times to roll the dice')

args = parser.parse_args()

# Now we can roll the dice

print args

num_dice = args.dice[0]
num_rolls = args.rolls[0]

print "Here's what you got:"

outcomes = dict()

for dice in range(num_dice):
	outcomes[dice] = []

same_value_all_rolls = 0
for roll in range(num_rolls):
	# Set is_same to check if all of the dice in a roll were the same value
	# Set sum_of_rolls to sum up the results for a roll
	is_same = True
	sum_of_rolls = 0

	for dice in range(num_dice):

		result = random.randrange(1, 6)
		outcomes[dice].append(result)
		sum_of_rolls += result

		print ("(" + str(outcomes[dice][roll]) + ")"),

		# Logic below calculates if all of the dice in a roll had the same value
		if dice != 0 and outcomes[dice][roll] != outcomes[dice - 1][roll]:
			is_same = False
			
	print "Sum of rolls was: " + str(sum_of_rolls),
	print ""
	if is_same:
		same_value_all_rolls += 1

# Check to see if any of the rows have the same value for all rolls
print str(round(((float(same_value_all_rolls) / num_rolls) * 100), 2)) + "% rolls were the same"
