/// @description variable declarations
background_map = ds_map_create();
background_map[? layer_get_id("Foreground")] = -.3;
background_map[? layer_get_id("Background1")] = 0;
background_map[? layer_get_id("Background2")] = 0.1;
background_map[? layer_get_id("Background3")] = 0.2;
background_map[? layer_get_id("Background4")] = 0.3;
background_map[? layer_get_id("Background5")] = 0.4;
background_map[? layer_get_id("Background6")] = 0.5;