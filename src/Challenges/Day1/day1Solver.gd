extends Solver

func _init():
	#FILENAME ONLY INCLUDING EXTENSION
	#MUST BE IN Folder "res://Challenges/Inputs/"
	inputFileName = "Day1.txt"; 

func solve_challenge() -> String:
	var objective := 2020
	var data : PoolStringArray = load_data()
	var dataAsNumbers : PoolIntArray
	for line in data:
		dataAsNumbers.append(int(line))
	for i in dataAsNumbers.size():
		for j in dataAsNumbers.size():
			if dataAsNumbers[i] == dataAsNumbers[j]:
				continue
			else:
				if dataAsNumbers[i] + dataAsNumbers[j] == objective:
					return str(dataAsNumbers[i]*dataAsNumbers[j])
		
	return ":("

func solve_bonus() -> String:
	var objective := 2020
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
					if dataAsNumbers[i] + dataAsNumbers[j] + dataAsNumbers[k] == objective:
						return str(dataAsNumbers[i]*dataAsNumbers[j]*dataAsNumbers[k])
	return ":("
