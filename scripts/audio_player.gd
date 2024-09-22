extends AudioStreamPlayer2D

const menu_music = preload("res://audio/menu_sound.mp3")

func _play_music(music: AudioStream, volume = -2.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func _stop_music():
	stop()
	
func play_menu_music():
	_play_music(menu_music)
	
func stop_menu_music():
	_stop_music()
