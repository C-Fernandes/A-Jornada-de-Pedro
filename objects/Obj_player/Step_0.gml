
script_execute(state);


if xp >= max_estamina[level]  {
	
	xp = xp - max_xp[level];
	
	if level < 4 {
	level += 1;
	vida = max_vida[level];
	estamina = max_estamina[level];
}}

if instance_exists(Obj_item) and Obj_inventario.inventario == false{
	var _inst = instance_nearest(x,y, Obj_item);
	
	if distance_to_point(_inst.x, _inst.y)<= 20{
		if keyboard_check_pressed(ord("F")) or (keyboard_check(ord("F"))) {
			ds_grid_add_item(_inst.image_index, _inst.quantidade, _inst.sprite_index);
			
			instance_destroy(_inst);
		}
	}
}