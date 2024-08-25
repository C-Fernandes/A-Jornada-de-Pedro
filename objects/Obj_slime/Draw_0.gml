/// @description Inserir descrição aqui

if (hit == true) {
    // Ativa a neblina (ajuste os valores para o efeito desejado)
    gpu_set_fog(true, c_white, 1, 100); // Modifique o segundo e terceiro parâmetro para ajustar o efeito
    draw_sprite(Spr_slime, 0, x-1, y+1);
    draw_self();
    gpu_set_fog(false, c_white, 0, 0); // Desativa a neblina
} else {
    draw_self(); // Caso não haja hit, ainda desenha o objeto
}

// Inverte a escala da imagem dependendo da direção
if (dest_x < x) {
    image_xscale = -1;
} else {
    image_xscale = 1;
}
