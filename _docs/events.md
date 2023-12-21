## Events

**Usage**:

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
