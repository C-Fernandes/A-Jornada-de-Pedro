/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if other.tomar_dano == true{
	var _dir = point_direction(x,y, other.x, other.y);

	with(other){
	empurrar_dir = _dir;
	state = scr_player_hit;
	alarm[1] = 10;
	alarm[2] = 180;
	tomar_dano = false;
	vida -= 1;
	}
}