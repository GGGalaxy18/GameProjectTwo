// Made following youtube tutorial by DragoniteSpam:
// https://www.youtube.com/watch?app=desktop&v=Q_RAGnirITo
application_surface_draw_enable(false);

var _camera = view_get_camera(0);
var _camera_width = camera_get_view_width(_camera);
var _camera_height = camera_get_view_height(_camera);

light_surface = surface_create(_camera_width, _camera_height);
foreground_surface = surface_create(_camera_width, _camera_height);

var _lay_id = layer_get_id("Foreground");
layer_script_begin(_lay_id, layer_render_start);
layer_script_end(_lay_id, layer_render_end);