**SaveLoadGame**
____________
*Usage*:
	- Every object you wish to save must have a serialize() and deserialize()
	method
	- Samples of these method implementations can be found in the GameData and
	PlayerData autoloads
	- The SaveLoadGame autload has the methods save_game() and load_game()
	all objects you wish to save and load must have their methods called in
	these methods (the order needs to be mirrored for save and load)
	Note: the save_game() and load_game() implementation is not the only method
	for saving and loading, you may have the game save from anywhere and load
	from anywhere. It is very important that the game is saved and loaded in
	the same order.

*Removal:*
	- This system can be safely removed, simply delete the autoload and make 
	sure all calls to its methods are removed
	- These calls can be found in the "main" scene, the "world" scene, and the
	"settings_menu" scene
	- Additionally, the serialize() and deserialize() methods found in the data
	autoloads can be removed
