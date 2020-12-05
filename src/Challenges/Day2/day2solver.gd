extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "556"
	bonusAnswer = "605"

func _solve_challenge() -> String:
	var data = load_data()
	var validNumber : int
	for line in data:
		validNumber += is_password_valid_sled(line)
	return str(validNumber)

func _solve_bonus() -> String:
	var data = load_data()
	var validNumber : int
	for line in data:
		validNumber += is_password_valid_tobbogan(line)
	return str(validNumber)

func is_password_valid_sled(line: String):
	var values = dict_that_shit(line)
	var numberOfTimes : int
	for letter in values.password:
		if letter == values.key:
			numberOfTimes += 1
	if numberOfTimes < values.low or numberOfTimes > values.high:
		return 0
	return 1

func is_password_valid_tobbogan(line: String):
	var values = dict_that_shit(line)
	if (values.password[values.low-1] == values.key) != (values.password[values.high-1] == values.key):
		return 1
	return 0

func dict_that_shit(line):
	var tokens = line.split(" ")
	var minMaxSplit = tokens[0].split("-")
	tokens[1] = tokens[1].trim_suffix(":")
	var index1 = int(minMaxSplit[0])
	var index2 = int(minMaxSplit[1])
	return {
		"password": tokens[2],
		"key":tokens[1],
		"low": index1,
		"high": index2
	}
