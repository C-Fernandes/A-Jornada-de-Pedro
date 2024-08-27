/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala =3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(Spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = Obj_player.vida;
var _maxvida = Obj_player.max_vida[Obj_player.level];

var _estamina = Obj_player.estamina;
var _maxestamina = Obj_player.max_estamina[Obj_player.level];

var _ajusteY = 3;
var _xp = Obj_player.xp;
var _maxxp =Obj_player.max_xp[Obj_player.level];
var _xpa =sprite_get_height(Spr_hud_exp);
var ajuste_y = 20;

//BARRA DA VIDA
draw_sprite_ext(Spr_hud_barra_vida, 0, _ajusteY, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1)

//BARRA DA ESTAMINA
draw_sprite_ext(Spr_hud_barra_estamina, 0, _ajusteY, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1)

//HUD
draw_sprite_ext(Spr_hud_vida, 0, _ajusteY, _huda, _escala, _escala, 0, c_white, 1)


//Barra de XP

draw_sprite_ext(Spr_hud_exp, 0, 0, _guia - _xpa - ajuste_y, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(Spr_hud_exp_barra, 0, 9, _guia - _xpa + 9 - ajuste_y, (_xp/_maxxp) * _escala, _escala, 0, c_white, 1);
