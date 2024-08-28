var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if(inventario == true){
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2
	draw_sprite_ext(Spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;
	
	for (var i = 0; i< total_slots; i++){
		
		
		var _slotsx = _invx + comeco_x + ((tamanho_slot + buffer) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slot + buffer) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slot, _slotsy +tamanho_slot){
			draw_sprite_ext(Spr_inventario_seletor, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			if keyboard_check_pressed(ord("F")){
				// Create an instance of the item on the ground
				var _inst = instance_create_layer(Obj_player.x, Obj_player.y, "Instances", Obj_item);
				_inst.sprite_index = Spr_itens;
				_inst.image_index = grid_itens[# Infos.Item, i];
				_inst.quantidade = grid_itens[# Infos.Quantidade, i];
				
				// Remove the item from the inventory
				grid_itens[# Infos.Item, i] = -1;
				grid_itens[# Infos.Quantidade, i] = -1;
			}
			
			if keyboard_check_pressed(ord("R")){
				if grid_itens[# Infos.Item, i] == Itens.Maca && grid_itens[# Infos.Quantidade, i] > 0 {
					Obj_player.vida = min(Obj_player.vida + 3, Obj_player.max_vida[Obj_player.level]);
					grid_itens[# Infos.Quantidade, i]--;
					if(grid_itens[# Infos.Item, i] == 0){
						instance_destroy();
					}
				}
			}

			if mouse_check_button_pressed(mb_left){
				//Caso nenhum item selecionado
				if item_selecionado == -1{
					item_selecionado = grid_itens[# Infos.Item, i];
					pos_selecionada = i;
				}
				//Caso item já selecionado
				else{
					//Caso esteja vazio:
					if grid_itens[# Infos.Item, i] == -1{
						grid_itens[# Infos.Item, i] = grid_itens[# Infos.Item, pos_selecionada];
						grid_itens[# Infos.Quantidade, i] = grid_itens[# Infos.Quantidade, pos_selecionada];
						
						grid_itens[# Infos.Item, pos_selecionada] = -1;
						grid_itens[# Infos.Quantidade, pos_selecionada] = -1;
						item_selecionado = -1;
						pos_selecionada = -1;
					}
					
					//Caso já tenha um item:
					else if grid_itens[# Infos.Item, pos_selecionada] != grid_itens[# Infos.Item, i]{
						var _item = grid_itens[# Infos.Item, i];
						var _quantidade = grid_itens[# Infos.Quantidade, i];
						
						grid_itens[# Infos.Item, i] = grid_itens[# Infos.Item, pos_selecionada];
						grid_itens[# Infos.Quantidade, i] = grid_itens[# Infos.Quantidade, pos_selecionada];
						
						grid_itens[# Infos.Item, pos_selecionada] = _item;
						grid_itens[# Infos.Quantidade, pos_selecionada] = _quantidade;
						
						item_selecionado = -1;
						pos_selecionada = -1;
					}
				}
			}
			
		}
			
		if grid_itens[# Infos.Item, i] != -1{
			draw_sprite_ext(Spr_itens, grid_itens[# Infos.Item, i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
		
			draw_set_font(fnt_inventario);
			draw_set_halign(fa_center);
			draw_text_color_outline(_slotsx + tamanho_slot, _slotsy + tamanho_slot - 8, grid_itens[# Infos.Quantidade, i], 4, c_black, 16, 100, 100);
		}
			
		ix++;
		if ix >= slots_h{
			ix =0;
			iy++;
		}
	}
	
	//Largar item selecionado
	if mouse_check_button(mb_right){
		item_selecionado = -1;
		pos_selecionada = -1;
	}
	
	if item_selecionado != -1 {
		draw_sprite_ext(Spr_itens, grid_itens[# Infos.Item, pos_selecionada], _mx, _my, escala, escala, 0, c_white, 0.5);
	}
}