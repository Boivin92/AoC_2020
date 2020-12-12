extends Node
class_name SeatLayout

const DIRECTIONS := [
	Vector2(-1,-1), Vector2(-1,0), Vector2(-1,1),
	Vector2(0,-1), Vector2(0,1), 
	Vector2(1,-1), Vector2(1,0), Vector2(1,1)]

var CurrentLayout := []
var Y_SIZE := 0
var X_SIZE := 0
var occupied_seats := 0
var cache := {}

func load_layout(inputs):
	CurrentLayout = inputs
	Y_SIZE = CurrentLayout.size()
	X_SIZE = CurrentLayout[0].length()

func calculate_next(lineOfSight = false):
	var next_layout := []
	for y in Y_SIZE:
		var new_line = ""
		for x in X_SIZE:
			new_line += process_tile(Vector2(x,y), lineOfSight)
		next_layout.append(new_line)
	return next_layout

func count_occupied_seats():
	var total = 0
	for y in Y_SIZE:
		for x in X_SIZE:
			if is_occupied(Vector2(x,y)):
				total += 1
	return total

func process_tile(position : Vector2, lineOfSight):
	match CurrentLayout[position.y][position.x]:
		'.': #Floor
			return "."
		'#': #Busy Seat
			var status = status_line_of_sight(position) if lineOfSight else seat_status(position)
			return "L" if status == "CROWDED" else "#"
		'L': #Free Seat
			var status = status_line_of_sight(position) if lineOfSight else seat_status(position)
			return "#" if status == "QUIET" else "L"


func seat_status(position : Vector2):
	var number = 0
	for d in DIRECTIONS:
		if is_occupied(position + d):
			number += 1
		if number == 4:
			return "CROWDED"
	return "QUIET" if number == 0 else "OTHER"

func status_line_of_sight(position : Vector2):
	var number = 0
	for d in DIRECTIONS:
		if busy_seat_in_direction(position, d):
			number += 1
			if number == 5:
				return "CROWDED"
	return "QUIET" if number == 0 else "OTHER"

func busy_seat_in_direction(position, direction):
	var posTemp = position + direction
	if not is_out_of_bounds(posTemp):
		while is_not_seat(posTemp):
			posTemp += direction
			if is_out_of_bounds(posTemp):
				break
		if is_occupied(posTemp):
			return true
	return false

func is_out_of_bounds(position : Vector2):
	if 	position.x < 0 or position.y < 0 or \
		position.y >= Y_SIZE or position.x >= X_SIZE:
			return true
	else: 
		return false

func is_not_seat(position : Vector2):
	return CurrentLayout[position.y][position.x] == "."

func is_occupied(position : Vector2):
	if cache.has(position):
		return cache[position]
		
	if 	is_out_of_bounds(position):
			cache[position] = false
			return false
	else:
		cache[position] = CurrentLayout[position.y][position.x] == "#"
		return CurrentLayout[position.y][position.x] == "#"
