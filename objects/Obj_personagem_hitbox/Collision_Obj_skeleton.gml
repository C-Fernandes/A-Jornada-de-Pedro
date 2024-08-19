/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
other.vida -= Obj_player.dano;

var _dir = point_direction(Obj_player.x, Obj_player.y, other.x, other.y);
other.empurrar_dir = _dir;
other.empurrar_veloc = 12;
other.state = scr_enemy_hit;
other.alarm[1] = 5;
other.hit = true;