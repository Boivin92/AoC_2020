extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "2470"
	bonusAnswer = "1973822685184"

var MULT_MAP = {5:7, 4:4, 3:2, 2:1}

func _solve_challenge() -> String:
	var sortedInputs = get_sorted_inputs()
	var OJDs := []
	var TJDs := []
	for i in range(1, sortedInputs.size()):
		if sortedInputs[i] == (sortedInputs[i-1] + 1):
			OJDs.append(i)
		elif sortedInputs[i] == (sortedInputs[i-1] + 3):
			TJDs.append(i)
	return str(OJDs.size() * TJDs.size())

func _solve_bonus() -> String:
	var sortedInputs = get_sorted_inputs()
	var i = 0
	var numberOfPermutations = 1
	while i < sortedInputs.size()-1:
		if next_is_plus_three(sortedInputs, i):
			i += 1
		else:
			var cons = number_of_consecutive_ones(sortedInputs, i)
			i += cons
			numberOfPermutations = numberOfPermutations * MULT_MAP[cons]
	return str(numberOfPermutations)

func get_sorted_inputs():
	var sortedInputs := []
	for line in inputData:
		sortedInputs.append(int(line))
	sortedInputs.append(0) #Wall socket
	sortedInputs.sort()
	sortedInputs.append(sortedInputs.back()+3) #Last adapter
	return sortedInputs

func next_is_plus_three(sortedInputs, currentIndex):
	return sortedInputs[currentIndex+1] == sortedInputs[currentIndex] + 3
	
func number_of_consecutive_ones(sortedInputs, startIndex):
	var offset = 1
	while (sortedInputs[startIndex] + offset) == sortedInputs[startIndex+offset]:
		offset += 1
	return offset
