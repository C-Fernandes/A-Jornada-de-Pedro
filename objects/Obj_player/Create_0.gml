// Inicialização de variáveis
cima = -1;
baixo = -1;
direita = -1;
esquerda = -1;

hveloc = 0;
vveloc = 0;
dir = 0;

velocidade = 2;
velocidade_running = 3;
velocidade_direcao = -1;

level = 1;

// Inicializar arrays para estamina, XP e vida
max_estamina = [100, 110, 120, 130, 140];
max_xp = [100, 120, 150, 200, 230];
max_vida = [20, 30, 40, 60, 80];

// Inicializar valores baseados no nível
estamina = max_estamina[level];
vida = max_vida[level];

// Inicializar combate
xp = 0;
dano = [1, 2, 3, 4, 5];
ataque = false;
state = scr_player_andando;

tomar_dano = true;
empurrar_dir = 0;
dano_alpla = -1;
