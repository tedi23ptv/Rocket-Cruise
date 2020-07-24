extends Node2D

export (int) var lvl
export (int) var quality
export (bool) var music

# var save = {
#	"lvl": 0,
#	"music" : true,
#	"quality" : -1,
#}

#func _ready():
#	save_data()

#func save_data():
#	var file = File.new()
#	file.open("user://save_game.txt", File.WRITE)
#	
#	file.store_string(save)
#	file.close()

#func load_save():
#	var file = File.new()
#	if not file.file_exists("user://save_game.txt"):
#		return false
#	file.open("user://save_game.txt", File.READ)
#	save = file.get_var()
#	file.close()
#	return true

