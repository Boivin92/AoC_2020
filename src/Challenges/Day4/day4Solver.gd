extends Solver

func _init():
	#FILENAME ONLY INCLUDING EXTENSION
	#MUST BE IN Folder "res://Challenges/Inputs/"
	inputFileName = "Day4.txt"
	bonusSolved = true #set to true once bonus is solved, yo 

func solve_challenge() -> String:
	var passports = load_passports()
	var i = 0
	for p in passports:
		if p.has_all_values():
			i += 1
	return str(i)

func solve_bonus() -> String:
	var passports = load_passports()
	var i = 0
	for p in passports:
		if p.has_all_values() and p.is_valid():
			i += 1
	return str(i)

func load_passports():
	var data = load_data()
	var passports = []
	passports.append(Passport.new())
	for line in data:
		if line == "":
			passports.append(Passport.new())
		else:
			passports.back().filter_line(line)
	return passports
