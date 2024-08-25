var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if(inventario == true){
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2
	draw_sprite_ext(Spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
}