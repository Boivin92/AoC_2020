extends Solver

func _ready():
	bonusSolved = true
	dayAnswer = "229"
	bonusAnswer = "6683"

func _solve_challenge() -> String:
	var rules := {}
	for line in inputData:
		var rule = create_color_rules(line)
		rules[rule[0]] = rule[1]
	
	var i = 0
	
	for color in rules:
		if has_shiny_gold(rules[color], rules):
			i += 1
	
	return str(i)

func _solve_bonus() -> String:
	var rules := {}
	for line in inputData:
		var rule = create_color_rules(line)
		rules[rule[0]] = rule[1]
	
	return str(count_bags("shiny gold", rules) -1)

func has_shiny_gold(colors, rules):
	if colors.has("shiny gold"):
		return true
	else:
		for color in colors:
			if has_shiny_gold(rules[color], rules):
				return true
	return false

func count_bags(color, rules):
	var colors_within = rules[color]
	var total_bags_within = 0
	for c in colors_within:
		total_bags_within += count_bags(c, rules) * colors_within[c]
	return 1 + total_bags_within

func create_color_rules(line: String):
	var first_split = line.split(" bags contain ")
	var contained_colors = {}
	if first_split[1] == "no other bags.":
		return [first_split[0], {}]
	else:
		var second_split = first_split[1].trim_suffix(".").split(", ")
		for color in second_split:
			var number = int(color)
			var colorDescriptor = color.trim_prefix(str(number)).trim_prefix(" ").trim_suffix(" bags").trim_suffix(" bag")
			contained_colors[colorDescriptor] = number
	return [first_split[0], contained_colors]
