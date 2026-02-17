extends TextureRect

const PLAY_SPEED = 30

var frame_i = 0
var spriteSheet : SpriteFrames
var has_sheet : bool = false

@onready var anim_timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func initialize(animation:SpriteFrames):
	has_sheet = true
	spriteSheet = animation
	next_frame()
	

func next_frame():
	frame_i = (frame_i+1)%spriteSheet.get_frame_count("gif")
	texture = spriteSheet.get_frame_texture("gif",frame_i)
	anim_timer.wait_time = spriteSheet.get_frame_duration("gif",frame_i)/PLAY_SPEED
	anim_timer.start()



func _on_timer_timeout() -> void:
	next_frame()
