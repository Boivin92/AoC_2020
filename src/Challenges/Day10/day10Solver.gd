extends Solver

func _ready():
	bonusSolved = false
#	dayAnswer = ""
#	bonusAnswer = ""

func _solve_challenge() -> String:
	var sortedInputs := []
	for line in inputData:
		sortedInputs.append(int(line))
	sortedInputs.sort()
	var OJDs := []
	var TJDs := []
	if sortedInputs[0] == 1:
		OJDs.append(0)
	elif sortedInputs[0] == 3:
		TJDs.append(0)
	for i in range(1, sortedInputs.size()):
		if sortedInputs[i] == (sortedInputs[i-1] + 1):
			OJDs.append(i)
		elif sortedInputs[i] == (sortedInputs[i-1] + 3):
			TJDs.append(i)
	return str(OJDs.size() * (TJDs.size()+1)) #Count the extra adapter

func _solve_bonus() -> String:
	return ""
