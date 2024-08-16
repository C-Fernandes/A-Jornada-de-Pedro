script_execute(state);

depth = -y;

if (hveloc != 0 or vveloc != 0) { // Movimento horizontal
   if(abs(hveloc) >= abs(vveloc)){ sprite_index = (hveloc < 0) ? Spr_skeleton_walking_esquerda : Spr_skeleton_walking_direita;
   }else { // Movimento vertical
	    sprite_index = (vveloc < 0) ? Spr_skeleton_walking_costas : Spr_skeleton_walking;}
} else {
    if (sprite_index == Spr_skeleton_walking_esquerda) {
        sprite_index = Spr_skeleton_esquerda; // Parado voltado para a esquerda
    } else if (sprite_index == Spr_skeleton_walking_direita) {
        sprite_index = Spr_skeleton_direita; // Parado voltado para a direita
    } else if (sprite_index == Spr_skeleton_walking_costas) {
        sprite_index = Spr_skeleton_costas; // Parado voltado para cima
    } else if (sprite_index == Spr_skeleton_walking) {
        sprite_index = Spr_skeleton; // Parado voltado para frente (padrão)
    }
}
