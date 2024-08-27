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
	Vela,
	Papel,
	Erva,
	Altura
}

enum Infos{
	Item,
	Quantidade,
	Altura
}

grid_itens = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_itens, 0, 0, 1, total_slots -1, -1);

ds_grid_add_item(Itens.Anel, 1);
ds_grid_add_item(Itens.Chave1, 3);
ds_grid_add_item(Itens.Chave2, 2);
ds_grid_add_item(Itens.Maca, 8);
ds_grid_add_item(Itens.Vela, 2)