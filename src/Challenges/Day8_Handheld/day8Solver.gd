extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "1446"
	bonusAnswer = "1403"

func _solve_challenge() -> String:
	return str(machine(inputData)[1])

func _solve_bonus() -> String:
	for i in inputData.size():
		var lineCopy = inputData[i]
		
		if inputData[i].substr(0,3) == "nop":
			inputData[i] = inputData[i].replace("nop", "jmp")
			var result = machine(inputData)
			if result[0]:
				return str(result[1])
			else:
				inputData[i] = lineCopy
				
		elif inputData[i].substr(0,3) == "jmp":
			inputData[i] = inputData[i].replace("jmp", "nop")
			var result = machine(inputData)
			if result[0]:
				return str(result[1])
			else:
				inputData[i] = lineCopy
				
	return "SOLUTION NOT FOUND"


func machine(inputs):
	var accumulator = 0
	var visited_indexes := []
	var i = 0
	while(not visited_indexes.has(i)):
		if i == inputs.size():
			return [true, accumulator]
		visited_indexes.append(i)
		var numeric_value = int(inputData[i]) #Quirk of the language. Filters all text out
		match inputData[i].substr(0,3):
			"acc":
				accumulator += numeric_value
				i += 1
			"jmp":
				i += numeric_value
			"nop":
				i += 1
	return [false, accumulator]
