class_name SceneBase extends Stage

enum INPUT_KEY_TYPE {
	NONE,
	UP,
	DOWN,
	LEFT,
	RIGHT,
	Z,
	X,
	ESCAPE,
	LEFTCLICK
}

var _fade_color : Color = Color(0, 0, 0)
var _flash_color : Color = Color(0, 0, 0)


var _tint_color : Color = Color(0, 0, 0)

var _active 		: bool
var _alpha 			: float = 1.0
var _fade_duration 	: int
var _fade_sign 		: int
var _fade_sprite 	: Node2D
var _flash_alpha 	: float = 1.0
var _flash_duration : int
var _flash_sign 	: int
var _flash_sprite   : Node2D


var _rain_particle : GPUParticles2D
var _snow_particle : GPUParticles2D
var _tint_alpha    : float = 1.0
var _tint_duration : int
var _tint_sign     : int
var _tint_sprite   : Node2D

var sound_manager : AudioStreamPlayer = null:
	get: return sound_manager

func _is_active() -> bool: # i dont understand why this needs to exist if active is already protected
	return _active

func _ready() -> void:
	if _rain_particle == null:
		_rain_particle = %Rain
		_rain_particle.emitting = false
	
	if _snow_particle == null:
		_snow_particle = %Snow
		_snow_particle.emitting = false
	
	_init()

func _init() -> void: # virtual
	_active = true

func _process(delta: float) -> void: # virtual
	pass

func _stop() -> void: # virtual
	_active = false

func _is_busy() -> bool:
	return _fade_duration > 0

func _start_fade_in(duration: int, white: bool) -> void:
	_alpha = 1.0
	_create_fade_sprite(white)
	_fade_sign = 1
	_fade_duration = duration
	_fade_sprite.modulate = Color(_fade_color.r, _fade_color.g, _fade_color.b, 1.0)

func _start_fade_out(duration: int, white: bool) -> void:
	_alpha = 0.0
	_create_fade_sprite(white)
	_fade_sign = -1
	_fade_duration = duration
	_fade_sprite.modulate = Color(_fade_color.r, _fade_color.g, _fade_color.b, 0.0)

func _create_fade_sprite(white: bool) -> void:
	if not _fade_sprite:
		var canvas = %Canvas
		var gameObject = Node2D.new()
		gameObject.name = "FadeObject"
		canvas.add_child(gameObject)
		#_fade_sprite = gameObject.add_child(Sprite2D.new())

func _update_fade() -> void:
	pass

func _set_fade_active(is_active: bool) -> void:
	_fade_sprite.set_process(is_active)

func _fade_speed() -> int:
	return 24

func _slow_fade_speed() -> int:
	return _fade_speed() * 2

func exec_event() -> void:
	pass

func create_tint_color() -> void:
	pass

func _start_tint_out(duration: int, tint: Color) -> void:
	pass

func _update_tint() -> void:
	pass

func create_flash_color() -> void:
	pass

func _start_flash(duration: int, flash: Color, a: int) -> void:
	pass

func _update_flash() -> void:
	pass

func _start_weather(type: String, power: int, frame: int) -> void:
	pass