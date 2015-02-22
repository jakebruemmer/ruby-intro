import argparse

parser = argparse.ArgumentParser(description="Make a version of Pascal's triangle")

parser.add_argument('levels', metavar='--levels', type=int, nargs='+', help="The number of levels that you'd like to evaluate")

args = parser.parse_args()

result = dict()

for i in range(args.levels[0]):
	result[i] = []
	for j in range(args.levels[0]):
		if i == 0:
			result[i].append(1)
		elif i > j:
			result[i].append(0)
		else:
			result[i].append(result[i - 1][j] + result[i - 1][j - 1])


print result
