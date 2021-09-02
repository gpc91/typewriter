// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @func word_details(text, position);
/// @arg {string} text 
/// @arg {real} position the cursor position to check.
/// @description Returns a struct containing details about the word the cursor is currently on.
function word_details(txt, pos)
{
	
	// if we land on a space, cycle back until we meet the first word.
	while (pos > 0 && string_char_at(txt, pos) == " ") // while we aren't at the very beginning of the string and we are on a space character move the pointer back.
	{
		pos --;
	}
	
	// now we should have reached a word, so decrement the pointer until we reach a space or the beginning of the string (found the start of the word).
	while (pos > 0 && string_char_at(txt, pos) != " ") // while we aren't at the very beginning of the string and we are not on a space character move the pointer back.
	{
		pos --;	
	}
	_s = ++pos; // store start position
	
	// start incrementing the pointer by 1 until we find the end of the word.
	while (pos <= string_length(txt) && string_char_at(txt, pos) != " ")
	{
		pos++;	
	}
	
	word = 
	{
		text : string_copy(txt, _s, pos-_s),
		start: _s,
		len: pos-_s
	};
	
	return word;
}	

function word_next(txt, pos)
{
	
	var current = word_details(txt, pos);
	
	var _p = current.start + current.len;
	while (_p <= string_length(txt) && string_char_at(txt, _p) == " ")
	{
		_p++;	
	}
	
	var next = word_details(txt, _p);
	
	return next;
	
}

// text wrap positional
function _tw(txt, pos, mw)
{		
	
	/*
		mw = max_width
	*/
	
	var _cw = word_details(text, pos);
	current_word = _cw;
	if (pos == (_cw.start + _cw.len))
	{
		var _nw = word_next(text, pos);
		next_word = _nw;
		if (string_width(txt + _nw.text + " ") > mw)
		{
			txt += "\n";
		}
		else
		{
			txt += string_char_at(text, pos);	
		}
	}
	else
	{
		txt += string_char_at(text, pos);	
	}
	return txt;
}

// text render positional
function _tr(txt, pos, mw)
{
	var _p = 1;
	var _t = "";
	while (	_p < pos)
	{
		_t = _tw(_t, _p++, mw);	
	}
	return _t;
}

// text word wrap
function _tww(txt, mw)
{
	var _p = 1; var _t = "";
	while ( _p <= string_length(txt))
	{
		_t = _tw(_t, _p++, mw);	
	}
	return _t;
}

// TODO : Word width greater than allowed max-width
// TODO : How do we want to handle over-flow in general?