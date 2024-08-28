cima = -1;
baixo=-1;
direita=-1;
esquerda =-1;

hveloc = 0;
vveloc = 0;
dir = 0;

velocidade = 2;
velocidade_running = 3;
velocidade_direcao = -1;


level = 1;

max_estamina[1] = 100;
max_estamina[2] = 110;
max_estamina[3] = 120;
max_estamina[4] = 130;
max_estamina[5] = 140;

estamina = max_estamina[level];

//Combate
xp = 0;
max_xp[1] = 100;
max_xp[2] = 120;
max_xp[3] = 150;
max_xp[4] = 200;
max_xp[5] = 230;

max_vida[1] = 20;
max_vida[2] = 30;
max_vida[3] = 40;
max_vida[4] = 60;
max_vida[5] = 80;
vida = max_vida[level];

//talvez nn seja necessário
tomar_dano = true; 
empurrar_dir = 0;

dano[1] = 1;
dano[2] = 2;
dano[3] = 3;
dano[4] = 4;
dano[5] = 5;
ataque = false;
state = scr_player_andando;


dano_alpla =-1;

