extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "235"
	bonusAnswer = "194"

func _solve_challenge() -> String:
	var passports = load_passports()
	var i := 0
	for p in passports:
		if p.has_all_values():
			i += 1
	return str(i)

func _solve_bonus() -> String:
	var passports = load_passports()
	var i := 0
	for p in passports:
		if p.is_valid():
			i += 1
	return str(i)

func load_passports() -> Array:
	var data = load_data()
	var passports := []
	passports.append(Passport.new())
	for line in data:
		if line == "":
			passports.append(Passport.new())
		else:
			passports.back().filter_line(line)
	return passports
