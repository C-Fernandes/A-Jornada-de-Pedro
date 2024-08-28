function scr_player_andando() {
    // Definir variáveis
   
    var running = keyboard_check(vk_shift);
    var direita = keyboard_check(ord("D"));
    var esquerda = keyboard_check(ord("A"));
    var cima = keyboard_check(ord("W"));
    var baixo = keyboard_check(ord("S"));

    // Definir a velocidade com base no estado de corrida
    hveloc = (direita - esquerda);
    vveloc = (baixo - cima);
	
    var velocidade_direcao = point_direction(x, y, x + hveloc, y + vveloc);

    if (hveloc != 0 || vveloc != 0) {
        var velocidade_atual = running ? velocidade_running : velocidade;
    } else {
        velocidade_atual = 0;
    }
	  // Diminuir estamina enquanto estiver correndo
    if (running && (hveloc != 0 || vveloc != 0)) {
      estamina -= 0.1; // Ajuste o valor para o ritmo de diminuição
        if (estamina <= 0) {
          estamina = 0; // Limitar a estamina a 0
            running = false; // Forçar o personagem a parar de correr
        }
    }if (!running && estamina < max_estamina[level]) {
    estamina += 0.005; // Regeneração da estamina fora da corrida
}
    hveloc = lengthdir_x(velocidade_atual, velocidade_direcao);
    vveloc = lengthdir_y(velocidade_atual, velocidade_direcao);
	scr_player_colisao();
    // Atualizar a velocidade da animação
    image_speed = running ? 1.7 : 1;
 
	 if (hveloc != 0) { // Movimento horizontal
	    sprite_index = Spr_player_walking_lado;
	    image_xscale = (hveloc < 0) ? -1 : 1; // Ajusta a direção do sprite
	} else if (vveloc != 0) { // Movimento vertical
	    sprite_index = (vveloc < 0) ? Spr_player_walking_costas : Spr_player_walking;
	    image_xscale = 1; // Mantém o sprite voltado para frente
	} else { // Quando o personagem está parado
	    if (sprite_index == Spr_player_walking_lado || sprite_index == Spr_player_atack_lado) {
	        sprite_index = Spr_player_lado; // Parado voltado para frente (padrão)
	      image_xscale = (image_xscale < 0) ? -1 : 1;
	    } else if (sprite_index == Spr_player_walking_costas || sprite_index == Spr_player_atack_costas) {
	        sprite_index = Spr_player_costas; // Parado voltado para cima
	    } else if (sprite_index == Spr_player_walking || sprite_index == Spr_player_atack) {
	        sprite_index = Spr_player; // Parado voltado para frente (padrão)
	    }
	}
    // Definir a profundidade com base na posição Y
    depth = -y;
    // Verifica o clique do mouse para realizar o ataque, somente se não estiver atacando
    if (mouse_check_button_pressed(mb_left) ) {
   
	state = scr_player_atack;
    }
}

function scr_player_colisao(){
	
	 var objects_collision = [Obj_colision, Obj_tree, Obj_tree_2, Obj_estatua, Obj_lapide, Obj_lapide_2, Obj_lapide_3, Obj_pocoQuebrado];
    var colisao_horizontal = false;
    var colisao_vertical = false;
    // Verificar colisão horizontal
    colisao_horizontal = false;
    for (var i = 0; i < array_length(objects_collision); i++) {
        if (place_meeting(x + hveloc, y, objects_collision[i])) {
            colisao_horizontal = true;
            break; // Se encontrar colisão, saia do loop
        }
    }

    if (colisao_horizontal) {
        while (place_meeting(x + sign(hveloc), y, objects_collision[i])) {
            x -= sign(hveloc);
        }
        hveloc = 0;
    }

    // Verificar colisão vertical
    colisao_vertical = false;
    for (var i = 0; i < array_length(objects_collision); i++) {
        if (place_meeting(x, y + vveloc, objects_collision[i])) {
            colisao_vertical = true;
            break; // Se encontrar colisão, saia do loop
        }
    }

    if (colisao_vertical) {
        while (place_meeting(x, y + sign(vveloc), objects_collision[i])) {
            y -= sign(vveloc);
        }
        vveloc = 0;
    }

    // Atualizar a posição do personagem
    x += hveloc;
    y += vveloc;
}

function scr_player_atack() {
	
	// Atualizar a sprite de ataque com base na direção do personagem
		if (sprite_index == Spr_player_lado || sprite_index == Spr_player_walking_lado) {
		    sprite_index = Spr_player_atack_lado;
		    image_xscale = (image_xscale < 0) ? -1 : 1; // Mantém a direção correta
		} else if (sprite_index == Spr_player_costas || sprite_index == Spr_player_walking_costas) {
		    sprite_index = Spr_player_atack_costas;
		    image_xscale = 1; // Direção normal
		} else if (sprite_index == Spr_player || sprite_index == Spr_player_walking) {
		    sprite_index = Spr_player_atack;
		    image_xscale = 1; // Direção normal
		}
    if image_index >= 1 {
        var offset = 30; 
        if (image_xscale == 1) { // Direita
            instance_create_layer(x + offset, y, "Instances", Obj_personagem_hitbox);
        } else if (image_xscale == -1) { // Esquerda
            instance_create_layer(x - offset, y, "Instances", Obj_personagem_hitbox);
        } else if (sprite_index == Spr_player_atack_costas) { // Cima
            instance_create_layer(x, y - offset, "Instances", Obj_personagem_hitbox);
        } else if (sprite_index == Spr_player_atack) { // Baixo
            instance_create_layer(x, y + offset, "Instances", Obj_personagem_hitbox);
        }
       // Marcar o ataque como finalizado após a hitbox ser criada
    }
 if (estamina > 0) {
        estamina -= 0.1; // Ajuste o valor conforme necessário
        if (estamina <= 0) {
            estamina = 0; // Garante que a estamina não seja negativa
        }
    }
    
    // Verificar o fim da animação de ataque
    if fim_da_animacao(){
		state = scr_player_andando;
   
    }
}

function scr_player_hit(){
	if alarm[1] > 0 {
	
		hveloc = lengthdir_x(15, empurrar_dir);
		vveloc = lengthdir_y(15, empurrar_dir);
	
		scr_player_colisao();
	} else {
		state = scr_player_andando;
	}
}