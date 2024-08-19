// Definir variáveis
var objects_collision = [Obj_forest, Obj_tree];
var colisao_horizontal = false;
var colisao_vertical = false;
var running = keyboard_check(vk_shift);
var direita = keyboard_check(ord("D"));
var esquerda = keyboard_check(ord("A"));
var cima = keyboard_check(ord("W"));
var baixo = keyboard_check(ord("S"));

// Definir a velocidade com base no estado de corrida
var hveloc = (direita - esquerda);
var vveloc = (baixo - cima);

var velocidade_direcao = point_direction(x, y, x + hveloc, y + vveloc);

if (hveloc != 0 || vveloc != 0) {
    var velocidade_atual = running ? velocidade_running : velocidade;
} else {
    velocidade_atual = 0;
}

hveloc = lengthdir_x(velocidade_atual, velocidade_direcao);
vveloc = lengthdir_y(velocidade_atual, velocidade_direcao);

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

// Atualizar a velocidade da animação
image_speed = running ? 1.7 : 1;

if (hveloc != 0) { // Movimento horizontal
    sprite_index = (hveloc < 0) ? Spr_player_walking_esquerda : Spr_player_walking_direita;
} else if (vveloc != 0) { // Movimento vertical
    sprite_index = (vveloc < 0) ? Spr_player_walking_costas : Spr_player_walking;
} else { // Quando o personagem está parado
    if (sprite_index == Spr_player_walking_esquerda) {
        sprite_index = Spr_player_esquerda; // Parado voltado para a esquerda
    } else if (sprite_index == Spr_player_walking_direita) {
        sprite_index = Spr_player_direita; // Parado voltado para a direita
    } else if (sprite_index == Spr_player_walking_costas) {
        sprite_index = Spr_player_costas; // Parado voltado para cima
    } else if (sprite_index == Spr_player_walking) {
        sprite_index = Spr_player; // Parado voltado para a frente (padrão)
    }
}

// Definir a profundidade com base na posição Y
depth = -y;
script_execute(state);
