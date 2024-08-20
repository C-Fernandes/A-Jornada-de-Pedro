/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if alarm[2]>0{
	if image_alpha >=1 {
		dano_alpla = -0.05;
	}else if image_alpha <=0{
	dano_alpla = 0.05;
	}
	image_alpha += dano_alpla;
}else{
	image_alpha = 1;
}