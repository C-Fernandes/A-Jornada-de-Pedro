// Função para escolher o próximo estado do inimigo
function scr_enemy_escolher_estado() {
	image_speed = 1;
	scr_enemy_checar_personagem();
    // Escolher entre andar ou parar
    var next_state = choose(scr_enemy_andando,scr_enemy_parado);
    
    // Verificar o próximo estado e ajustar o comportamento
    if (next_state == scr_enemy_andando) {
        state = scr_enemy_andando;
        dest_x = irandom_range(0, room_width);
        dest_y = irandom_range(0, room_height);
    } else if (next_state == scr_enemy_parado) {
        state = scr_enemy_parado;
    }
}

// Função para verificar colisões
function scr_enemy_colision() {
    var objects_collision = [Obj_forest, Obj_tree]; 
    
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
		   dest_x = irandom_range(0, room_width);
        
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
		dest_y = irandom_range(0, room_height);
    }
	y+=vveloc;
	x+=hveloc;
}

// Função para movimentar o inimigo (andar)
function scr_enemy_andando() {
	scr_enemy_checar_personagem();
    // Calcular a direção para o destino
	
	if distance_to_point(dest_x, dest_y) > velocidade{
	    var _dir = point_direction(x, y, dest_x, dest_y);
    
	    // Calcular a velocidade horizontal e vertical com base na direção
		 hveloc = lengthdir_x(velocidade, _dir);
	     vveloc = lengthdir_y(velocidade, _dir);
    
	    // Verificar colisões e mover o inimigo
	    scr_enemy_colision();
    } else {
		x=dest_x;
		y=dest_y;
	}

}



// Função para quando o inimigo está parado (não faz nada)
function scr_enemy_parado() {
	scr_enemy_checar_personagem();
	hveloc = 0;
	vveloc = 0;
    // O inimigo permanece parado até o próximo estado ser escolhido
}

// Função para checar a proximidade do personagem
function scr_enemy_checar_personagem() {
    if (distance_to_object(Obj_player) <= dist_atack) {
        state = scr_enemy_perseguindo;
    }
}

// Função para o inimigo perseguir o personagem
function scr_enemy_perseguindo() {
	image_speed = 2;
    dest_y = Obj_player.y;
    dest_x = Obj_player.x;

    // Calcular a direção para o personagem
    var _dir = point_direction(x, y, dest_x, dest_y);
    
    // Calcular a velocidade horizontal e vertical com base na direção
    hveloc = lengthdir_x(velocidade_perseg, _dir);
    vveloc = lengthdir_y(velocidade_perseg, _dir);

    // Verificar colisões e mover o inimigo
    scr_enemy_colision();
	
	if distance_to_object(Obj_player) >= dist_distancia{
		state = scr_enemy_escolher_estado;
		alarm[0] = irandom_range(120,240);
		image_speed = 1;
	}
}

function scr_enemy_hit(){
	empurrar_veloc = lerp(empurrar_veloc, 0, 0.2)
	
	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);
	
	scr_enemy_colision()
}





