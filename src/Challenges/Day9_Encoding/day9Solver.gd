extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "675280050"
	bonusAnswer = "96081673"

func _solve_challenge() -> String:
	for i in inputData.size():
		if i < 25:
			continue
		else:
			if find_weakness(range(i-25, i), inputData[i]):
				return str(inputData[i])
	return "Could not find flaw in algorithm"

func _solve_bonus() -> String:
	for i in inputData.size():
		if i < 25:
			continue
		else:
			if find_weakness(range(i-25, i), inputData[i]):
				return str(discover_flaw(int(inputData[i])))
	return ""

func find_weakness(data_range, target_value):
	var dataAsNumbers : PoolIntArray = PoolIntArray()
	for i in data_range:
		dataAsNumbers.append(int(inputData[i]))
	for i in dataAsNumbers.size():
		for j in dataAsNumbers.size():
			if dataAsNumbers[i] == dataAsNumbers[j]:
				continue
			else:
				if dataAsNumbers[i] + dataAsNumbers[j] == int(target_value):
					return false
	return true

func discover_flaw(target_value):
	for i in inputData.size():
		var total = int(inputData[i])
		for j in range(i+1, inputData.size()):
			total += int(inputData[j])
			if total == target_value:
				return lowest_highest(i,j)
			elif total > target_value:
				break
	return -1

func lowest_highest(low_position, high_position):
	var data := []
	for i in range(low_position, high_position+1):
		data.append(int(inputData[i]))
	data.sort()
	return data.front() + data.back()
