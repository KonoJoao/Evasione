// Move o projétil para a esquerda
x += velocidade;

// Atualiza a distância percorrida
distancia_percorrida += velocidade;

// Verifica se atingiu a distância máxima
if (distancia_percorrida >= distancia_maxima) {
    instance_destroy(); // Destroi o projétil
}