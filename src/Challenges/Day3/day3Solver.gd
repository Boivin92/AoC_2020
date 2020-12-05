extends Solver

const ANGLES := [	Vector2(1,1), 
					Vector2(1,3), 
					Vector2(1,5), 
					Vector2(1,7), 
					Vector2(2,1)]

const FOREST_WIDTH = 31

func _ready():
	bonusSolved = true
	dayAnswer = "276"
	bonusAnswer = "7812180000"

func _solve_challenge() -> String:
	return str(trees_for_angle(1,3))

func _solve_bonus() -> String:
	var result = 1
	for angle in ANGLES:
		result = result * trees_for_angle(angle.x, angle.y)
	return str(result)

func trees_for_angle(down : int, right: int):
	var data = load_data()
	var currentPosition = right
	var numberOfTrees = 0
	
	for i in range(down, data.size(), down):
		if data[i][currentPosition] == "#":
			numberOfTrees+=1
		currentPosition = (currentPosition + right) % FOREST_WIDTH
	
	return numberOfTrees
