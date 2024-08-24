function fim_da_animacao(){	
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
	    _spd = _spd/room_speed;
	if(argument_count > 2) _spd = argument[2];
	return _image + _spd >= sprite_get_number(_sprite);
	

	//Dono do codigo: PixellatedPope e Minty Python
} 

function draw_text_color_outline(){
	var dto_dcol = draw_get_color();
	
	draw_set_color(argument4);
	
	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
		draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
	}
	draw_set_color(dto_dcol);
	
	draw_text_ext(argument0, argument1, argument2, argument6, argument7);
}