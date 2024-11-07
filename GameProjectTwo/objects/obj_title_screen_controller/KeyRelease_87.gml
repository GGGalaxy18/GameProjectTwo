/// @description go up selection
var _index = array_find_index(buttons, function(_e, _i) { return _e == selected_button; });

_index--;
if _index < 0 {
	_index = array_length(buttons) - 1;
}

selected_button = buttons[_index];