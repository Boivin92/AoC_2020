extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "2270"
	bonusAnswer = "138669"

const DIRECTIONS := {
	"E" : Vector2(1,0),
	"W" : Vector2(-1,0),
	"N" : Vector2(0,-1),
	"S" : Vector2(0,1)
}

func _solve_challenge() -> String:
	var ship = Node2D.new()
	add_child(ship)
	ship.rotation_degrees = 0
	for line in inputData:
		var value = int(line) #Quirk of the language - it works!
		var letter : String = line.substr(0,1)
		if letter == "F":
			pass
		match letter:
			"E", "W", "N", "S":
				ship.translate(DIRECTIONS[line[0]] * value)
			"R":
				ship.rotation_degrees = abs_rotation(ship.rotation_degrees + value)
			"L":
				ship.rotation_degrees = abs_rotation(ship.rotation_degrees - value)
			"F":
				ship.translate(value * rot_to_dir(ship.rotation_degrees))
	var manhatan_distance = manhatan(ship)
	ship.queue_free()
	return str(manhatan_distance)

func _solve_bonus() -> String:
	var ship = Node2D.new()
	add_child(ship)
	var waypoint = Node2D.new()
	add_child(waypoint)
	waypoint.position = Vector2(10, -1) #10 East, North 1
	ship.rotation_degrees = 0
	for line in inputData:
		var value = int(line) #Quirk of the language - it works!
		var letter : String = line.substr(0,1)
		if letter == "F":
			pass
		match letter:
			"E", "W", "N", "S":
				waypoint.translate(DIRECTIONS[line[0]] * value)
			"R":
				waypoint.position = waypoint.position.rotated(deg2rad(value))
			"L":
				waypoint.position = waypoint.position.rotated(deg2rad(-value))
			"F":
				ship.translate(value * waypoint.position)
	var manhatan_distance = manhatan(ship)
	ship.queue_free()
	waypoint.queue_free()
	return str(int(manhatan_distance))

func manhatan(node):
	return abs(node.position.x) + abs(node.position.y)

func rot_to_dir(degrees):
	match int(degrees):
		0:
			return DIRECTIONS["E"]
		90:
			return DIRECTIONS["S"]
		180:
			return DIRECTIONS["W"]
		270:
			return DIRECTIONS["N"]

func abs_rotation(degrees):
	while degrees <= 0.0:
		degrees += 360.0
	while degrees >= 360.0:
		degrees -= 360.0
	return degrees

