extends Solver

func _init():
	#FILENAME ONLY INCLUDING EXTENSION
	#MUST BE IN Folder "res://Challenges/Inputs/"
	inputFileName = "Day3.txt"
	bonusSolved = true #set to true once bonus is solved, yo 

func solve_challenge() -> String:
	return str(number_of_trees(1,3))

func solve_bonus() -> String:
	return str(number_of_trees(1,1)*
	number_of_trees(1,3)*
	number_of_trees(1,5)*
	number_of_trees(1,7)*
	number_of_trees(2,1))

func number_of_trees(down, right):
	var data = load_data()
	var lenght = 31
	var currentPosition = right
	var numberOfTrees = 0
	range(down, data.size(), down)
	for i in range(down, data.size(), down):
		if data[i][currentPosition] == "#":
			numberOfTrees+=1
		currentPosition = (currentPosition + right) % lenght
	return numberOfTrees
