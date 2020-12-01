extends Node
class_name Solver

var inputFileName

func load():
	var file = File.new()
	file.open("res://Challenges/Inputs/" + inputFileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func solve_challenge() -> String:
	return ""

func solve_bonus() -> String:
	return ""
