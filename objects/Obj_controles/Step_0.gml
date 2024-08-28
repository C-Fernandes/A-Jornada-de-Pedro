if (position_meeting(mouse_x, mouse_y, id)) {
    // Cursor está sobre o botão
    image_index = 1; // Altera para o frame 1 (destacado)
} else {
    // Cursor não está sobre o botão
    image_index = 0; // Altera para o frame 0 (normal)
}