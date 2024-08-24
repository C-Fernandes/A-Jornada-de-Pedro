// Obter a largura da view da câmera
var _cl = camera_get_view_width(view_camera[0]);

// Obter a altura da view da câmera (corrigido)
var _ca = camera_get_view_height(view_camera[0]);

// Calcular escala em relação à GUI
escalax = display_get_gui_width() / _cl;
escalay = display_get_gui_height() / _ca;

// Inicializar variáveis de dano e alvo
dano = -1;
alvo = -1;

xx = alvo.x;
yy = alvo.y;
    //xx = 0;  // Valor padrão caso não haja alvo
    //yy = 0;  // Valor padrão caso não haja alvo


// Definir alpha
alpha = 1;
