extends Node

"""
saved_data keys:
	player_name
"""
const SAVED_GAME_PATH = "user://SavedGame.json"

var saved_data = {}


func get_data():
	var file = File.new()

	#If the file doesn't exist, create one
	if not file.file_exists(SAVED_GAME_PATH):
		saved_data = {"player_name": "Unnamed"}
		save_game()
	
	#Get the file contents
	file.open(SAVED_GAME_PATH, File.READ)
	var content = file.get_as_text()
	var data = parse_json(content)
	saved_data = data
	file.close()
	return (data)


func save_game():
	var saved_game = File.new()
	saved_game.open(SAVED_GAME_PATH, File.WRITE)
	saved_game.store_line(to_json(saved_data))


func _ready():
	saved_data = get_data()

