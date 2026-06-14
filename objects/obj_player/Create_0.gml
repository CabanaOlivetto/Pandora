// Velocidade do player
velh = 0; 
velv = 0; 
vel  = 2; 

global.controle_travado = false;

inputs = {
    left:  ord("A"),
    right: ord("D"),
    up:    ord("W"),
    down:  ord("S")
    // Deixei sem o "interact" aqui, já que o seu NPC e sua porta lêem o "E" sozinhos direto no código deles!
}; 

controles_invertidos = false; 