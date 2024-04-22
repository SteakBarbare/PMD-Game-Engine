/// @description Insert description here
// You can write your code in this editor

if(playstate == "Attack"){
	if(image_index >= 8 && hitBox > 0){
		hitBox--;
		instance_create_depth(x, y, -y, objCharacterHitbox);
	}
	if(image_index >= image_number -1){
		playstate = "Idle";
		sprite_index = sprKnightIdle;
	}
}else{
	playstate = "Idle";

	// Movement
	if(keyboard_check(vk_right)){
		x += hSpeed;
		image_xscale = 1;
		playstate = "Walk";
	}
	if(keyboard_check(vk_left)){
		x -= hSpeed;
		image_xscale = -1;
		playstate = "Walk";
	}
	if(keyboard_check(vk_up)){
		y -= vSpeed;
		playstate = "Walk";
	}
	if(keyboard_check(vk_down)){
		y += vSpeed;
		playstate = "Walk";
	}

	// Attack
	if(keyboard_check(vk_space)){
		playstate = "Attack";
		image_index = 0;
		sprite_index = sprKnightAttack;
	}

	// Sprite Change
	if(playstate == "Walk"){
		sprite_index = sprKnightWalk;
	}else if(playstate == "Idle"){
		sprite_index = sprKnightIdle;
	}
}










