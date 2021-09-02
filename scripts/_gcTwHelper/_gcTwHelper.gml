// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@function typewriter_create(x, y, width, height);
///@param {real} x
///@param {real} y
///@param {real} width
///@param {real} height
function typewriter_create(__x, __y, __width, __height){

	var __twInst = instance_create_depth(__x, __y, 0, __gcoTw);

	__twInst.width = __width;
	__twInst.height = __height;

	return __twInst;

}

/// @function typewriter_set_padding(instance_id, [padding-right], [padding-top], [padding-left], [padding-bottom]);
/// @param {real} instance_id
/// @param {real} padding-right
/// @param {real} padding-top
/// @param {real} padding-left
/// @param {real} padding-bottom
function typewriter_set_padding(__id, __right = noone, __top = noone, __left = noone, __bottom = noone){
// using the noone keyword (-4) as we shouldn't have negative values in the padding anyway.
	if (__right >= 0)
	{
		__id.padding.right = __right;	
	}
	
	if (__top >= 0)
	{
		__id.padding.top = __top;	
	}
		
	if (__left >= 0)
	{
		__id.padding.left = __left;	
	}
		
	if (__bottom >= 0)
	{
		__id.padding.bottom = __bottom;	
	}	
}

///@function typewriter_set_speed(instance_id, speed_minimum, [speed_maximum]);
///@param {real} instance_id
///@param {real} speed_minimum
///@param {real} speed_maximum	!OPTIONAL 
function typewriter_set_speed(__id, __speed_minimum, __speed_maximum = noone)
{
	// speed_minimum and speed_maximum (in seconds)
	__id.typing_speed_min = __speed_minimum;
	if (__speed_maximum > __speed_minimum)
	{
		__id.typing_speed_max = __speed_maximum	
	}
}

///@function typewriter_write(instance_id, message);
///@param {real} instance_id
///@param {string} message
function typewriter_write(__id, __text)
{
	
	__id.text = __text;
	
	__id.typed = "";
	__id.render_text = "";
	__id.__tp = 1;
	
	with (__id)
	{
		// make sure max is always greater or equal to minimum.
		if (typing_speed_max < typing_speed_min) 
		{
			typing_speed_max = typing_speed_min;
		}
		
		alarm_value = clamp(random_range(typing_speed_min, typing_speed_max), 1 / game_get_speed(gamespeed_fps), game_get_speed(gamespeed_fps) * 60);
		
		alarm_set(0, alarm_value);
		
	}
}

/// @function typewriter_set_debug(instance_id, debug);
/// @param {real} instance_id
/// @param {bool} debug
function typewriter_set_debug(__id, __debug)
{
	__id.__debug = __debug;		
}

function typewriter_destroy(__id)
{
	instance_destroy(__id);	
}