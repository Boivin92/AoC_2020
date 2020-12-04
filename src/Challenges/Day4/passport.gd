extends Node
class_name Passport

var BirthYear : String
var IssueYear : String
var ExpirationYear : String
var Height : String
var HairColor : String
var EyeColor : String
var PassportId : String
var CountryId : String

func filter_line(line):
	var inputs = line.split(" ")
	for i in inputs:
		var keyValue = i.split(":")
		match(keyValue[0]):
			"byr":
				BirthYear = keyValue[1]
			"iyr":
				IssueYear = keyValue[1]
			"eyr":
				ExpirationYear = keyValue[1]
			"hgt":
				Height = keyValue[1]
			"hcl":
				HairColor = keyValue[1]
			"ecl":
				EyeColor = keyValue[1]
			"pid":
				PassportId = keyValue[1]
			"cid":
				CountryId = keyValue[1]

func has_all_values():
	var i = 0
	if BirthYear and IssueYear and ExpirationYear and Height and  HairColor and EyeColor and PassportId:
		return true
	return false

func is_valid():
	return birth_is_valid() and issue_is_valid() and expiration_is_valid() and height_is_valid() and hair_is_valid() and eye_is_valid() and id_is_valid()

func birth_is_valid():
	if BirthYear.length() == 4:
		var birth = int(BirthYear)
		if (birth <= 2002) and (birth >= 1920):
			return true
	return false
	
func issue_is_valid():
	if IssueYear.length() == 4:
		var issue = int(IssueYear)
		if (issue <= 2020) and (issue >= 2010):
			return true
	return false

func expiration_is_valid():
	if ExpirationYear.length() == 4:
		var expiration = int(ExpirationYear)
		if (expiration <= 2030) and (expiration >= 2020):
			return true
	return false

func height_is_valid():
	var size = int(Height)
	if Height.ends_with("cm"):
		return (size >= 150) and (size <=193)
	if Height.ends_with("in"):
		return (size >= 59) and (size <=76)

func hair_is_valid():
	var numbers = "0123456789abcdef"
	if HairColor.length() == 7:
		if HairColor[0] == "#":
			for i in range(1,6):
				if numbers.find(HairColor[i]) == -1:
					return false
			return true
	return false
	

func eye_is_valid():
	var validEyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
	return (validEyeColors.find(EyeColor) != -1)

func id_is_valid():
	var validChars = "0123456789"
	if PassportId.length() == 9:
		for letter in PassportId:
			if validChars.find(letter) == -1:
				return false
		return true
	return false
