# Systems Documentation

This file contains documentation for all of the core systems of this template.
It contains both broad information and specific use cases. More specific
information can be found in Godot's in-editor [class reference](#ineditor-documentation).


## In-Editor Documentation

Documentation can be found in the Godot's in-editor class reference. A search prefixed with "Docs"
will pull up references for the systems (e.g. `DocsSaveLoadGame`). 

<details>
<summary><b>Current Documentation</b>:</summary>

- DocsSceneManager

- DocsSaveLoadGame

- DocsEvents

- DocsAudioManager

- LoadingScreen
</details>


## Audio Manager

**Usage**:

**Overview**:

- The audio manager is used in conjunction with the primary audio bus layout
  "default_bus_layout.tres" which can be found in the audio subfolder which is
  located within the common folder.

- The functions within this class utilize linear volume which is a percentage
  from 0.0 to 1.0. The built-in method `linear_to_db()` is used to make these
  values usable.

**Removal**:

- This function can be deleted and all calls made to it removed.

  - These calls can be found in the "settings_menu" scene.


## Events

**Usage**:

**Overview**:

- The intent of the "Events" autoload is to make the propogation of global
  signals more streamlined. This autoload is not for all signals but rather
  for signals which interact with many systems or for signals which may
  be difficult to connect directly at runtime.

  > Note: It is far too easy to overuse this system and it can have some
  > negative side-effects. When too many signals are connected it can
  > make it difficult to track all connections for debugging or
  > refactoring. Because of this, try to keep the usage to a minimum and
  > use it only when it is the best option.

**Removal**:

- This system can simply be deleted.
  
    - It has no calls made to it elsewhere, it is only intended to
      serve as an example implementation.


## SaveLoadGame

**Usage**:

**Overview**:
	
- Every object you wish to save must have a `serialize()` and `deserialize()`
method.

	- Samples of these method implementations can be found in the GameData and
	PlayerData autoloads.

- The SaveLoadGame autoload has the methods `save_game()` and `load_game()`;
all objects you wish to save and load must have their methods called in
these methods (the order needs to be mirrored for save and load).

	> *Note:* the `save_game()` and `load_game()` implementation is not the only method
	> for saving and loading, you may have the game save from anywhere and load
	> from anywhere. It is very important that the game is saved and loaded in
	> the same order.

**Removal:**

- This system can be safely removed, simply delete the autoload and make 
sure all calls to its methods are removed.

	- These calls can be found in the "main" scene, the "world" scene, and the
	"settings_menu" scene.

- Additionally, the `serialize()` and `deserialize()` methods found in the data
autoloads can be removed.


## SceneManager

**Usage**:

**Overview**:
	
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

**Removal:**

- This system can be safely removed, simply delete the autoload and make 
sure all calls to its methods are removed.

	- These calls can be found in the "main_menu" scene and the "settings_menu"
	scene.<br><br>

	> *Note:* This makes the "loading_screen" scene obsolete, so it can be removed
	>  as well.
