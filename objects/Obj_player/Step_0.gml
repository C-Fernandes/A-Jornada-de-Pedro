var objects_collison = [Obj_forest, Obj_tree];
var colisao_horizontal = false;
var colisao_vertical = false;

direita = keyboard_check(ord("D"))
esquerda = keyboard_check(ord("A"))
cima = keyboard_check(ord("W"))
baixo = keyboard_check(ord("S"))

hveloc = (direita - esquerda) * velocidade;
vveloc = (baixo - cima) *velocidade;

// Verifica colisão horizontal
for (var i = 0; i < array_length(objects_collison); i++) {
    if (place_meeting(x + hveloc, y, objects_collison[i])) {
        colisao_horizontal = true;
        break; // Se encontrar colisão, saia do loop
    }
}

if (colisao_horizontal) {
    while (!place_meeting(x + sign(hveloc), y, objects_collison[i])) {
        x += sign(hveloc);
    }
    hveloc = 0;
}

// Verifica colisão vertical
for (var i = 0; i < array_length(objects_collison); i++) {
    if (place_meeting(x, y + vveloc, objects_collison[i])) {
        colisao_vertical = true;
        break; // Se encontrar colisão, saia do loop
    }
}

if (colisao_vertical) {
    while (!place_meeting(x, y + sign(vveloc), objects_collison[i])) {
        y += sign(vveloc);
    }
	
	
    vveloc = 0;
}





x+= hveloc;
y+= vveloc;