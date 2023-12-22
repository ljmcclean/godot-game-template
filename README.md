# Godot Game Template (***In Progress***)


![Static Badge](https://img.shields.io/badge/Godot-4.2-blue?logo=godotengine&logoColor=ffffff&style=flat-square&labelColor=121821) 
![Static Badge](https://img.shields.io/badge/License-MIT-750014?style=flat-square&labelColor=121821)


## Summary
<details>
<summary><h3>Includes:</h2></summary>

- Player
  
  > Basic movement state machine with idle, moving, jumping, and falling states
  > already setup.
  
- State Machine
  
  > Basic finite state machine for managing anything with single active states.
  > (e.g. player, enemy, crops, etc.)
  
- Save &amp; Load System
  
  > Uses encrypted binary serialization to provide security, a smaller save file,
  > and a custom save structure. This system is highly customizable for more
  > complex projects. Also contains methods for saving and loading user
  > preferences (controls, volume, etc.).
  
- Scene Manager
  
  > A simple scene manager to provide additional utilites such as a loading screen
  > and simple pause and resume functions to abstract and simplify basic processes.

- Basic Menus
  > Simple main menu, loading screen, and settings menu. They are purely functional
  > and will require sprucing up. They have built in scene changes and buttons for
  > necessary interaction. The settings menu interfaces with necessary systems
  > and can update and save user preferences.

- Simple Audio System
  > This system includes some basic convenience functions and a prebuilt bus layout
  > integrated with the settings system.
</details>

The intent of this template is unlike some of the other options that can be found on GitHub. Many
of these templates serve the role of providing out-of-the-box, behind the scenes utilities that
make development easier. This template is similar sans the 'behind the scenes'. The goal of this
project is that you would not only have a solid basis for your project but that you would also
have a clear understanding of, and ability to modify, its underlying systems. That being said, you
will need to update these systems as your project progresses. This process should provide you a 
greater ability to customize and make full use of these systems.


## Getting Started

There are two options to get started:

#### 1. GitHub Template:
1. Create a new repository using this [template](https://github.com/new?template_name=godot_game_template&template_owner=LucksDev)
2. Clone the repository on your device
3. Open the project in [Godot](https://godotengine.org/download/)

#### 2. Local Project:
1. Go to the latest release (not yet active)
2. Download the source code zip
3. Unzip the project
4. Open the project in [Godot](https://godotengine.org/download/)


## Setting Up

Now that you have the project on your device you will need to do a few things before you can
get going.

- Set the projects Default Bus Layout to "res://common/resources/default_bus_layout.tres"

  > This settings can be found via the Project tab > Project settings... > General > Audio >
  > Buses > Default Bus Layout

- Set the Main Scene to "res://scenes/main/main.tscn"

  > This settings can be found via the Project tab > Project settings... > General > Application >
  > Run > Main Scene


## Further Information

For specific details about each of the systems you can reference the [docs](_docs) or you can use 
Godot's in-editor class reference ([learn more](_docs/in-editor-documentation.md)). 

For best practices and style guide you can reference the [style_guide](_docs/style_guide.md). And for 
notes on the project structure you can reference the [file structure documentation](_docs/file_structure.md).

**Autoload Roles**:

- SceneManager
  
  > [Scene_Manager Documentation](_docs/scene_manager.md)
  
  - The scene manager is used for handling scene changes and transitions. It comes with several
    methods for handling loading screens, additive loads, etc.
    
- AudioManager

  > [Audio Manager Documentation](_docs/audio_manager.md)
  
  - The audio manager serves the role of abstracting low-level interactions with Godot's `AudioServer`
    while simultaneously ensuring consistent transitions for volume and effects.

- Events

  > [Events Documentation](_docs/events.md)

  - The events singleton provides a single point for global signal handling.

- SaveLoadGame

  > [Save & Load Game Documentation](_docs/save_load_game.md)

  - This class is used for saving and loading the game with encrypted binary serialization. This means
    that this class is likely the most flexible but also one of the most complex of all of the autoloads.
    If you feel lost, NightQuestGames has a wonderful
    [resource](https://www.nightquestgames.com/godot-4-save-and-load-games-how-to-build-a-robust-system/)
    that covers all of the intricacies of the process thoroughly.

    
## Resources, Credit, & Licensing

This project is free to use, modify, or redistribute (see [LICENSE](LICENSE.md)). Credit is not required
but it is appreciated. If you would like to credit me feel free to link my 
[GitHub account](https://github.com/LucksDev).

Godot Download: [Download](godotengine.org/download)
- Godot License: [License](godotengine.org/license)

Thank you to...

- [NightQuestGames](https://www.nightquestgames.com/ "NightQuestGames' blog")

- [GDQuest](https://www.gdquest.com/ "GDQuest's website")

- Godot's amazing [community](https://www.bing.com/ck/a?!&&p=f5a756818708d6cfJmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xMzMyNDg1ZS04NGJkLTY0MTktMmYxZi01YmNlODVjYTY1MzcmaW5zaWQ9NTE5Ng&ptn=3&ver=2&hsh=3&fclid=1332485e-84bd-6419-2f1f-5bce85ca6537&psq=official+godot+discord&u=a1aHR0cHM6Ly9kaXNjb3JkLmNvbS9pbnZpdGUvekg3TlVneg&ntb=1 "Godot's official Discord server")
