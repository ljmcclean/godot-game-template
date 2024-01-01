# Systems Documentation

This file contains documentation for all of the core systems of this template.
It contains both broad information and specific use cases. More specific
information can be found in Godot's in-editor class reference (see below).


> ### In-Editor Documentation
> 
> Documentation can be found in the Godot's in-editor class reference. A search prefixed with "Docs"
> will pull up references for the systems (e.g. `DocsSaveLoadGame`). 
> 
> <details>
> <summary><b>Current Documentation</b>:</summary>
> 
> - DocsScenes
> 
> - DocsSaveLoad
> 
> - DocsEvents
> 
> - DocsAudio
>
> - DocsUserPrefs
> 
> - LoadingScreen
> </details>

## Systems

### Audio Manager

> Audio

<details>
<summary><b>Overview</b>:</summary>

- The audio manager is used in conjunction with the primary audio bus layout
  "default_bus_layout.tres" which can be found in the audio subfolder which is
  located within the common folder.

- The functions within this class utilize linear volume which is a percentage
  from 0.0 to 1.0. The built-in method `linear_to_db()` is used to make these
  values usable.

![Sample Audio Bus Layout](https://github.com/LucksDev/godot_game_template/assets/121735106/240d5893-fbfe-4368-8189-d9c7f12a9147)

>This is a sample audio bus layout in Godot. In this example the "Master" bus
>is at index one, the "Music" bus is at index two, etc.

</details>

<details>
<summary><b>Usage</b>:</summary>

#### Set bus volume

Signature:
```gdscript
func set_volume(bus_index: int, volume: float) -> void:
    ...
```

Sample call:
```gdscript
Audio.set_volume(2, .5)
```

> This call would set the volume for bus two to half.

___

#### Fade bus in

Signature:
```gdscript
func fade_in(bus_index: int, volume: float, duration: float) -> void:
    ...
```

Sample call:
```gdscript
Audio.fade_in(1, .2, 1.3)
```

> This call would fade bus one's volume to twenty percent over
> the span of 1.3 seconds.

___

#### Fade bus out

Signature:
```gdscript
func fade_out(bus_index: int, duration: float) -> void:
    ...
```

Sample call:
```gdscript
Audio.fade_out(3, .4)
```

> This call would fade bus three's volume to zero over the
> span of .4 seconds.

</details>

<details>
<summary><b>Removal</b>:</summary>

- This function can be deleted and all calls made to it removed.

  - These calls can be found in the "settings_menu" scene.
</details>

___

### Events

> Events

<details>
<summary><b>Overview</b>:</summary>

- The intent of the "Events" autoload is to make the propogation of global
  signals more streamlined. This autoload is not for all signals but rather
  for signals which interact with many systems or for signals which may
  be difficult to connect directly at runtime.

  > Note: It is far too easy to overuse this system and it can have some
  > negative side-effects. When too many signals are connected it can
  > make it difficult to track all connections for debugging or
  > refactoring. Because of this, try to keep the usage to a minimum and
  > use it only when it is the best option.
</details>

<details>
<summary><b>Usage</b>:</summary>

 #### Declare a signal

 ```gdscript
signal player_died
```

> With parameters:
> ```gdscript
> signal player_hit(damage: int, enemy_type: String)
> ```

___

#### Connect a signal

Signature:

```gdscript
connect(signal: StringName, callable: Callable, flags: int = 0) -> Error:
    ...
```

Sample Call:
```gdscript
Events.connect("player_died", _on_player_died)
```

> With parameters:
> ```gdscript
> Events.connect("player_hit", _on_player_hit.bind(dmg: int, enemy: String))
> ```

___

#### Emit a signal

Signature:

```gdscript
func emit_signal(signal: StringName) -> Error:
    ...
```

Sample Call:
```gdscript
emit_signal("player_died")
```

> With parameters:
> ```gdscript
> emit_signal("player_hit", 5, "skeleton")
> ```


</details>

<details>
<summary><b>Removal</b>:</summary>

- This system can simply be deleted.
  
    - It has no calls made to it elsewhere, it is only intended to
      serve as an example implementation.
</details>

___

### Save & Load Game

> SaveLoad

<details>
<summary><b>Overview</b>:</summary>
	
- Every object you wish to save must have a `serialize()` and `deserialize()`
method.

	- Samples of these method implementations can be found in the GameData and
	PlayerData autoloads.

- The SaveLoad autoload has the methods `save_game()` and `load_game()`;
all objects you wish to save and load must have their methods called in
these methods (the order needs to be mirrored for save and load).

	> *Note:* the `save_game()` and `load_game()` implementation is not the only method
	> for saving and loading, you may have the game save from anywhere and load
	> from anywhere. It is very important that the game is saved and loaded in
	> the same order.

![Example Saveable Class](https://github.com/LucksDev/godot_game_template/assets/121735106/c80c504c-98f5-499c-b206-513a7685d0c2)

> Note that each class that you wish to save must have a `serialize()` and
> `deserialize()` method that *mirror* each other.

</details>

 
<details>
<summary><b>Usage</b>:</summary>

#### Initialize SaveLoad

Signature:
```gdscript
func initialize(f_path: String, f_password: String) -> void:
    ...
```

Sample call:
```gdscript
SaveLoad.initialize("user://savegame.sav", "password")
```

> This initializes the class to use the "savegame.sav" file and
> encrypt/decrypt using the password "password".

___

#### Reset SaveLoad

Signature:
```gdscript
func clear() -> void:
    ...
```

Sample call:
```gdscript
SaveLoad.clear()
```

> This call will reset SaveLoad by clearing `file_path`, `file`,
> and `password`.

___

#### Open a file for saving or loading

Signature:
```gdscript
func open_file(access: FileAccess.ModeFlags) -> int:
    ...
```

Sample call:
```gdscript
SaveLoad.open_file(FileAccess.READ)
```

> This call will open the file that we initialized in `FileAccess.READ`
> mode. This means that we can only read from the file (useful for loading).
> Alternatively we can openit in `FileAccess.WRITE` mode which will allow
> us to edit (useful for saving).

___

#### Close a file when done

Signature:
```gdscript
func close_file() -> void:
    ...
```

Sample call:
```gdscript
SaveLoad.close_file()
```

> Sets `file` equal to null resulting in Godot handling the file closure.

___

#### Save/Load a single object

Signatures:
```gdscript
func serialize(object) -> void:   # Save an object
    ...
func deserialize(object) -> void: # Load an object
    ...
```

Sample calls:
```gdscript
SaveLoad.serialize(GameData)   # Save GameData
SaveLoad.deserialize(GameData) # Load GameData
```

> First calls GameData's save method, then its load method.

> **Important**: The object you are saving must also have a serialize and
> deserialize method which handles the saving and loading. *Not all objects
> can be saved*. Only the ones for which you have defined a saving and
> loading process.

___

#### Save/Load game

Signatures:
```gdscript
func save_game() -> void:
    ...
func load_game() -> void:
    ...
```

Sample calls:
```gdscript
SaveLoad.save_game()
SaveLoad.load_game()
```

Sample Implementations:
```gdscript
func save_game() -> void:
    open_file(FileAccess.WRITE)
    serialize(GameData)
    serialize(PlayerData)
    close_file()

func load_game() -> void:
    open_file(FileAccess.READ)
    deserialize(GameData)
    deserialize(PlayerData)
    close_file()
```

> Notice that these methods manually serialize/deserialize *all objects
> that need to be saved*. And in *the same order*. This will need to be
> updated in addition to individual `serialize()` and `deserialize()`
> methods written on saveable classes.

___

#### How to set up a saveable class

Signatures:
```gdscript
func serialize(file : FileAccess) -> void:
    ...
func deserialize(file : FileAccess) -> void:
    ...
```

Sample processes:
```gdscript
func serialize(file : FileAccess) -> void:
    file.store_32(spawn_location.x)
    file.store_32(spawn_location.y)

func deserialize(file : FileAccess) -> void:
    spawn_location.x = file.get_32()
    spawn_location.y = file.get_32()
```

> These methods must be present in every class that you wish to save.
> To learn more about how to store different data types in files,
> please reference Godot's documentation on
> [FileAccess](https://docs.godotengine.org/en/stable/classes/class_fileaccess.html).

</details>

<details>
<summary><b>Removal</b>:</summary>

- This system can be safely removed, simply delete the autoload and make 
sure all calls to its methods are removed.

	- These calls can be found in the "main" scene, the "world" scene, and the
	"settings_menu" scene.

- Additionally, the `serialize()` and `deserialize()` methods found in the data
autoloads can be removed.
</details>

___

### Scene Manager

> Scenes

<details>
<summary><b>Overview</b>:</summary>
	
- You must update the scene manager every time you add a scene which you
would like it to have access to.

	- You will need to add the scene's alias and path to the `scenes` dictionary.

- To switch scenes simply call `switch_scenes("alias")` or, alternatively,
if the scene is large and you would like a loading screen you can call 
`load_scene("alias")`.

- If you wish to additively load a scene, i.e. not remove the current scene,
you may call the `add_scene()` method.

	> *Note:* You will likely want to remove this scene using `queue_free()` or a
	> similar process as using `switch_scene()` or `load_scene()` will clear the
	> entire tree.
</details>

<details>
<summary><b>Usage</b>:</summary>
</details>


<details>
<summary><b>Removal</b>:</summary>

- This system can be safely removed, simply delete the autoload and make 
sure all calls to its methods are removed.

	- These calls can be found in the "main_menu" scene and the "settings_menu"
	scene.<br><br>

	> *Note:* This makes the "loading_screen" scene obsolete, so it can be removed
	>  as well.
</details>

___

### User Preferences

> UserPrefs

<details>
<summary><b>Overview</b>:</summary>
</details>

<details>
<summary><b>Usage</b>:</summary>

 #### Save/Load user preferences

Signatures:
```gdscript
func save_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> void:
    ...
func load_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> void:
    ...
```

Sample calls:
```gdscript
SaveLoad.save_user_prefs()
SaveLoad.load_user_prefs()
```

> These methods will save and load predefined preferences to
> "user://user_prefs.cfg" ny default.

</details>

<details>
<summary><b>Removal</b>:</summary>

- This system can be removed. Delete the *user_prefs* folder in *"res://autoloads"*
  and remove all calls.

	- These calls can be found in the "main_menu" scene and the "settings_menu"
	scene.<br><br>

	> *Note:* This makes the "user_data" resource and script obsolete, so they
 	> can be removed as well. They can be found at *"res://common/resources/
 	> user_data"*.
</details>
