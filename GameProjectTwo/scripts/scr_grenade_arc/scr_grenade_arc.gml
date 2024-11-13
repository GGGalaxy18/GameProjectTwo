// From user Alice on https://forum.gamemaker.io/index.php?threads/throw-grenade-making-an-arc.106673/
function get_arc_altitude(_progress, _initial_altitude, _max_altitude, _landing_altitude) {
    var _low_altitude = _progress < 0.5 ? _initial_altitude : _landing_altitude; // chooses initial or landing altitude as the "low" altitude
	_max_altitude = min(_initial_altitude, _landing_altitude) - _max_altitude;
    var _altitude_fraction = 1 - sqr(2 * _progress - 1); // calculates current altitude normalised to 0-1 range
    return lerp(_low_altitude, _max_altitude, _altitude_fraction); // calculates the actual altitude to correct the Y by
}