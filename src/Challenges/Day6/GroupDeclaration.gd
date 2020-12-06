extends Solver
class_name GroupDeclaration

var declarations = []
var checked = {}

func _init():
	var alphabet = "abcdefghijklmnopqrstuvwxyz"
	for letter in alphabet:
		checked[letter] = 0

func read(line: String):
	declarations.append(line)
	for i in line.length():
		checked[line[i]] += 1

func get_total_anyone():
	var number = 0
	for key in checked:
		if checked[key] > 0:
			number += 1
	return number

func get_total_everyone():
	var number = 0
	for key in checked:
		if checked[key] == declarations.size():
			number += 1
	return number
