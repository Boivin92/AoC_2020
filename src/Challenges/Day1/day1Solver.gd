extends Solver

const TARGET_NUMBER : int = 2020

func _ready():
	bonusSolved = true 
	dayAnswer = "692916"
	bonusAnswer = "289270976"

func _solve_challenge() -> String:
	var data : PoolStringArray = load_data()
	var dataAsNumbers : PoolIntArray
	for line in data:
		dataAsNumbers.append(int(line))
	for i in dataAsNumbers.size():
		for j in dataAsNumbers.size():
			if dataAsNumbers[i] == dataAsNumbers[j]:
				continue
			else:
				if dataAsNumbers[i] + dataAsNumbers[j] == TARGET_NUMBER:
					return str(dataAsNumbers[i]*dataAsNumbers[j])
		
	return ":("

func _solve_bonus() -> String:
	var data : PoolStringArray = load_data()
	var dataAsNumbers : PoolIntArray
	for line in data:
		dataAsNumbers.append(int(line))
	for i in dataAsNumbers.size():
		for j in dataAsNumbers.size():
			for k in dataAsNumbers.size():
				if i == j or j == k or i == k:
					continue
				else:
					if dataAsNumbers[i] + dataAsNumbers[j] + dataAsNumbers[k] == TARGET_NUMBER:
						return str(dataAsNumbers[i]*dataAsNumbers[j]*dataAsNumbers[k])
	return ":("
