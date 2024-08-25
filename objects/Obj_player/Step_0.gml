
script_execute(state);

if xp >= max_estamina[level]{
	
	xp = xp - max_xp[level];
	level += 1;
	
	vida = max_vida[level];
	estamina = max_estamina[level];
}