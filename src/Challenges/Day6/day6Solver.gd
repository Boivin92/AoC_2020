extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "6387"
	bonusAnswer = "3039"

func _solve_challenge() -> String:
	var declarations = create_declarations()
	
	var total = 0
	for d in declarations:
		total += d.get_total_anyone()
	
	return str(total)

func _solve_bonus() -> String:
	var declarations = create_declarations()
	
	var total = 0
	for d in declarations:
		total += d.get_total_everyone()
	
	return str(total)

func create_declarations():
	var declarations := []
	declarations.append(GroupDeclaration.new())
	for line in inputData:
		if line == "":
			declarations.append(GroupDeclaration.new())
		else:
			declarations.back().read(line)
	return declarations
