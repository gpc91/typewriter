/// @description Insert description here
// You can write your code in this editor
if (__debug == true)
{
	draw_set_color(c_red);
		draw_rectangle(x, y, x + width, y + height, 1);
	draw_set_color(c_green);
		draw_rectangle(x + padding.left, y + padding.top, x + width - padding.right, y + height - padding.bottom, 1);
	draw_set_color(c_white);
	
	draw_set_valign(fa_bottom);
	current_word = word_details(text, __tp);		
	draw_text(x, y + height + 25, "current word");
	draw_text(x, y + height + 50, current_word);
	draw_text(x, y + height + 75, __tp);
	draw_text(x, y + height + 100, alarm_get(0));
	draw_text(x, y + height + 125, clamp(game_get_speed(gamespeed_fps) * random_range(typing_speed_min, typing_speed_max), 1 / game_get_speed(gamespeed_fps), game_get_speed(gamespeed_fps) * 60));
	draw_set_valign(fa_top);
	
}

draw_text(x + padding.left, y + padding.top, render_text);
