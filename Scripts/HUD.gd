
extends Control

onready var points = get_node("PointLabel/Points")
onready var wave = get_node("WaveLabel/Wave")
onready var temp_bar = get_node("Progress/ProgressBar")
onready var speed_time = get_node("Progress/ProgressBar1")

var seconds = 0

func _ready():
	set_process(true)

func _process(delta):
	points.set_text(str(Points.points))
	wave.set_text(str(Points.wave))
	temp_bar.set_value(Points.get_temp())
