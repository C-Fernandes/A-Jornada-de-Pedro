script_execute(state);

depth = -y;

if vida<=0{
	instance_destroy();
}

if (hveloc != 0 or vveloc != 0) { // Movimento horizontal
	
   if(abs(hveloc) > abs(vveloc)){ 
	   sprite_index = Spr_slime_walking_lado;
	  image_xscale = (hveloc < 0) ? -1:1;
   }else { // Movimento vertical
	    sprite_index = (vveloc < 0) ? Spr_slime_walking_lado : Spr_slime_walking_lado;}
} else {
    // Parado voltado para a esquerda
    if (sprite_index == Spr_slime_walking_lado) {
        sprite_index = Spr_slime_walking_lado; // Parado voltado para a direita
    } else if (sprite_index == Spr_slime_walking_lado) {
		image_xscale = 1;
        sprite_index = Spr_skeleton_costas; // Parado voltado para cima
    } else if (sprite_index == Spr_slime_walking_lado) {
		image_xscale = 1;
        sprite_index = Spr_slime_walking_lado; // Parado voltado para frente (padrão)
    }
}
