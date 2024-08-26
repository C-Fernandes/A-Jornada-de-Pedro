inventario = false;
escala = 3;

comeco_x = 15 * escala;
comeco_y = 24 * escala;

slots_h = 8;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slot = 16 * escala;
buffer = 1 * escala;

inventario_l = sprite_get_width(Spr_inventario) * escala;
inventario_a = sprite_get_height(Spr_inventario) * escala;

item_selecionado = -1;
pos_selecionada = -1;

enum Itens{
	Anel,
	Chave1,
	Chave2,
	Maca,
	Altura
}

enum Infos{
	Item,
	Quantidade,
	Altura
}

grid_itens = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_itens, 0, 0, 1, total_slots -1, -1);

//Primeiro Slot:
grid_itens[# Infos.Item, 0] = Itens.Anel;
grid_itens[# Infos.Quantidade, 0] = 1;

//Segundo Slot:
grid_itens[# Infos.Item, 1] = Itens.Chave1;
grid_itens[# Infos.Quantidade, 1] = 3;

//Terceiro Slot:
grid_itens[# Infos.Item, 2] = Itens.Chave2;
grid_itens[# Infos.Quantidade, 2] = 2;

//Quarto Slot:
grid_itens[# Infos.Item, 5] = Itens.Maca;
grid_itens[# Infos.Quantidade, 5] = 5;