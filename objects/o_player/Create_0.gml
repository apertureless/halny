/// @description Player Init


// Inherit the parent event
event_inherited();


height = 56;

set_mask(52);

#region Abilities
dash_attack_cooldown = 0;
dash_attack_cooldown_max = 0.5;
#endregion

keyboard_inputs[0] = ord("D");
keyboard_inputs[1] = ord("W");
keyboard_inputs[2] = ord("A");
keyboard_inputs[3] = ord("S");

movespeed_base = 400;

leg_position = 1;
anim_timer = 0;
moving = false;

charge_speed = 2000;
charge_x_target = x;
charge_y_target = y;
charging = false;
charge_direction = 0;

#region Animation

var body_xoffset = sprite_get_xoffset(s_character_body);
var body_yoffset = sprite_get_yoffset(s_character_body);

bodypart_hand_back = 0;
bodypart_body = 1;
bodypart_head = 2;
bodypart_hand_front = 3;

animator_limb_setup(bodypart_body, body_xoffset, body_yoffset, s_character_body, 0, 1, 1)
animator_limb_setup(bodypart_head, 45, 17, s_character_head, 0, 1, 1)
animator_limb_setup(bodypart_hand_back, 65, 20, s_character_arm_back, 15, 1, 1)
animator_limb_setup(bodypart_hand_front, 20, 20, s_character_arm_front, -15, 1, 1)
 

for (var i = 0; i < array_length_1d(limb_xoffset); i++) {
	limb_distance[i] = point_distance(body_xoffset, body_yoffset, limb_xoffset[i], limb_yoffset[i]);
	limb_direction[i] = point_direction(body_xoffset, body_yoffset, limb_xoffset[i], limb_yoffset[i]);
	
	limb_xoffset[i] = 0;
	limb_yoffset[i] = 0;
}

#endregion