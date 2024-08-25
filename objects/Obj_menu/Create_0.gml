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