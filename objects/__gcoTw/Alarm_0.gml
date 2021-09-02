/// @description Insert description here
// You can write your code in this editor
if (__tp <= string_length(text))
{
	typed += string_char_at(text, __tp++);	
	render_text = _tww(typed, (width - padding.right) - (padding.left));
	alarm_value = clamp(random_range(typing_speed_min, typing_speed_max), 1 / game_get_speed(gamespeed_fps), game_get_speed(gamespeed_fps) * 60);
	alarm_set(0, alarm_value);
}
