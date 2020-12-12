extends Node
class_name SeatLayout

var CurrentLayout := []

func load_layout(inputs):
	CurrentLayout = inputs

func calculate_next():
	var next_layout := []
	for y in CurrentLayout.size():
		var new_line = ""
		for x in CurrentLayout[0].length():
			new_line += process_tile(x,y)
		next_layout.append(new_line)
	return next_layout

func count_occupied_seats():
	var total = 0
	for y in CurrentLayout.size():
		for x in CurrentLayout[y].length():
			if is_occupied(x,y):
				total += 1
	return total

func process_tile(x,y):
	var pound = "#"
	var test = CurrentLayout[y][x]
	match CurrentLayout[y][x]:
		'.':
			return "."
		'#':
			if count_occupied_seats_around(x,y) >= 4:
				return "L"
			else:
				return "#"
		'L':
			if count_occupied_seats_around(x,y) == 0:
				return "#"
			else:
				return "L"

func count_occupied_seats_around(x,y):
	var adjacents := [[x-1, y-1], [x, y-1], [x+1, y-1],
	[x-1, y], [x+1, y], [x-1, y+1], [x, y+1], [x+1, y+1]]
	var number = 0
	for a in adjacents:
		if is_occupied(a[0], a[1]):
			number += 1
	return number

func is_occupied(x,y):
	if x < 0 or y < 0 or y >= CurrentLayout.size() or x >= CurrentLayout[y].length():
		return false
	else:
		return CurrentLayout[y][x] == "#"
