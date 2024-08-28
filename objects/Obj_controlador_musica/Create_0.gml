if (!audio_is_playing(Snd_trilha_sonora)) {
    audio_play_sound(Snd_trilha_sonora, 1, true); // Toca a trilha sonora no volume 1, em loop infinito
}