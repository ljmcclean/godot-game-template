class_name DocsEvents
extends Node
## This class is for the management of gobally accessible signals.
##
## It should not be use for every single event in the game but rather for
## events which have global effects that multiple classes need to respond to.
## Additionally, it can be used in the case that it would be insecure to
## directly connect signals or cases in which it would otherwise be difficult
## or generally inadvisable.

# Signal 
signal player_died
