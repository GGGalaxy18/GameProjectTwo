/// @description go down selection
var _index = array_find_index(buttons, function(_e, _i) { return _e == selected_button; });

_index++;
if _index >= array_length(buttons) {
	_index = 0;
}

selected_button = buttons[_index];