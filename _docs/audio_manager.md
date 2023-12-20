## Audio Manager

**Usage**:

- The audio manager is used in conjunction with the primary audio bus layout
  "default_bus_layout.tres" which can be found in the audio subfolder which is
  located within the common folder.

- The functions within this class utilize linear volume which is a percentage
  from 0.0 to 1.0. The built-in method `linear_to_db()` is used to make these
  values usable.


**Removal**:

- This function can be deleted and all calls made to it removed.

  - These calls can be found in the "settings_menu" scene.
