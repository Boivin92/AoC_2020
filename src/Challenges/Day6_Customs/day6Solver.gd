extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "6387"
	bonusAnswer = "3039"

func _solve_challenge() -> String:
	return str(count_for_method("get_total_anyone"))

func _solve_bonus() -> String:
	return str(count_for_method("get_total_everyone"))

func count_for_method(method):
	var declarations = create_declarations()
	
	var total = 0
	for d in declarations:
		total += d.call(method)
	
	return total

func create_declarations():
	var declarations := []
	declarations.append(GroupDeclaration.new())
	for line in inputData:
		if line == "":
			declarations.append(GroupDeclaration.new())
		else:
			declarations.back().read(line)
	return declarations
