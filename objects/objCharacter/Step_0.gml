/// @description Playstates & Movements

// While the attack hasn't reached the last frame, keep the playstate and prevent other actions
if(playstate == "Attack"){
	// Once at frame 8, create a hitbox
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
		hMovement += hSpeed;
		image_xscale = 1;
		playstate = "Walk";
	}
	if(keyboard_check(vk_left)){
		hMovement -= hSpeed;
		image_xscale = -1;
		playstate = "Walk";
	}
	if(keyboard_check(vk_up)){
		vSpeed = -5
		vMovement += vSpeed;
		playstate = "Walk";
	}
	if(keyboard_check(vk_down)){
		vMovement += vSpeed;
		playstate = "Walk";
	}

	// Attack Init
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

// Add Gravity if vertical speed isn't high enough

vSpeed += gravityForce;
vMovement += vSpeed;


// Check for collision with objSolid
if(!place_meeting(x + hMovement, y, objSolid)){
	x += hMovement;
}
if(!place_meeting(x, y + vMovement, objSolid)){
	y += vMovement;
}else{
	vSpeed = 5;
}










