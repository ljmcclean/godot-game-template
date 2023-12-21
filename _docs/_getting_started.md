# Getting Started

The intent of this template is unlike some of the other options that can be found on GitHub. Many
of these templates serve the role of providing out-of-the-box, behind the scenes utilities that
make development easier. This template is similar sans the 'behind the scenes'. The goal of this
project is that you would not only have a solid basis for your project but that you would also
have a clear understanding of and ability to modify its underlying systems. That being said, you
will need to update these systems as your project progresses. While that may sound like a nuisance,
I would argue that this method will provide you a greater ability to customize and make full use
of these systems.

There are two options to get started:

### 1. GitHub Template:
1. Create a new repository using this [template]
2. Clone the repository on your device
3. Open the project in [Godot](https://godotengine.org/download/)

### 2. Local Project:
1. Go to the latest [release]
2. Download the source code zip
3. Unzip the project
4. Open the project in [Godot](https://godotengine.org/download/)


## Next Steps

Now that you have the project on your device you will need to do a few things before you can
get going.

- Set the projects Default Bus Layout to "res://common/resources/default_bus_layout.tres"

  > This settings can be found via the Project tab > Project settings... > General > Audio >
  > Buses > Default Bus Layout

- Set the Main Scene to "res://scenes/main/main.tscn"

  > This settings can be found via the Project tab > Project settings... > General > Application >
  > Run > Main Scene

## How To Use

For specific details about each of the systems you can reference the 
[_docs](https://github.com/LucksDev/godot_game_template/tree/main/_docs) folder or you can
use Godot's in-editor class reference. All systems that come with this template can be found in
the class reference by prefixing their name with "Docs" (e.g. `DocsAudioManager`).

For best practices and style guide you can reference the 
[style_guide](https://github.com/LucksDev/godot_game_template/blob/main/_docs/style_guide.md).

**Autoload Roles**:

- SceneManager
  
  - The scene manager is used for handling scene changes and transitions. It comes with several
    methods for handling loading screens, additive loads, etc.
    
- AudioManager
  
  - The audio manager serves the role of abstracting low-level interactions with Godot's `AudioServer`
    while simultaneously ensuring consistent transitions for volume and effects.

- Events

  - The events singleton provides a single point for global signal handling.

- SaveLoadGame

  - This class is used for saving and loading the game with encrypted binary serialization. This means
    that this class is likely the most flexible but also one of the most complex of all of the autoloads.
    If you feel lost, NightQuestGames has a wonderful
    [resource](https://www.nightquestgames.com/godot-4-save-and-load-games-how-to-build-a-robust-system/)
    that covers all of the intricacies of the process thoroughly.
