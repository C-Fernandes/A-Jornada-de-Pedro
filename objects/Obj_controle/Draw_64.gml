/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala =3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(Spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = Obj_player.vida;
var _maxvida = Obj_player.max_vida;
var _estamina = Obj_player.estamina;
var _maxestamina = Obj_player.max_estamina;


//BARRA DA VIDA
draw_sprite_ext(Spr_hud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1)

//BARRA DA ESTAMINA
draw_sprite_ext(Spr_hud_barra_estamina, 0, 0, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1)

//HUD
draw_sprite_ext(Spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1)
