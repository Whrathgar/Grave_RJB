
switch (state)
{
	case "move":
		#region Move State
		if input.right //(keyboard_check(vk_right) or keyboard_check(ord("D"))) 
		{
			//x += 4;
			move_and_collide(run_speed,0);
			sprite_index = s_skeleton_run;
			image_xscale = 1;
			image_speed = 0.7;
		}

		if input.left //(keyboard_check(vk_left) or keyboard_check(ord("A"))) 
		{
			//x -= 4;
			move_and_collide(-run_speed,0)
			sprite_index = s_skeleton_run;
			image_xscale = -1;
			image_speed = 0.7;
		}

		if not input.right and not input.left // and not keyboard_check(vk_left) and not keyboard_check(ord("A"))
		{
			sprite_index = s_skeleton_idle;
			image_speed = 0.4;
		}
	
		if  input.roll //keyboard_check_pressed(vk_space)
		{
			state = "roll";
		}
		
		if input.attack //keyboard_check_pressed(vk_lcontrol)
		{
			state = "attack_one";
		}
		
		#endregion
		break;
	
	case "roll":
		#region Roll State
		set_state_sprite(s_skeleton_roll, 0.7,0);
		if image_xscale == 1 
		{
			move_and_collide(roll_speed,0);
		}
		
		if image_xscale == -1
		{
			move_and_collide(-roll_speed,0);
		}
		
		if animation_end()
		{
			state = "move";
		}
		
		#endregion
		break;
		
	case "attack_one":
		#region Attack One State
		set_state_sprite(s_skeleton_attack_one, 0.7,0);
		if animation_hit_frame(0)
		{
			create_hitbox(x, y, self,s_skeleton_attack_one_damage, 4, 4, 5, image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(2,5)
		{
			state = "attack_two";
		}
		
		if animation_end()
		{
			state = "move";
		}
		
		#endregion
		break;

	case "attack_two":
		#region Attack Two State
		set_state_sprite(s_skeleton_attack_two, 0.7,0)
		
		if animation_hit_frame(1)
		{
			create_hitbox(x, y, self,s_skeleton_attack_two_damage, 4, 4, 5, image_xscale)
		}
		
		if input.attack and animation_hit_frame_range(1,4)
		{
			state = "attack_three";
		}
		
		if animation_end()
		{
			state = "move";
		}
		
		#endregion
		break;
		
	case "attack_three":
		#region Attack Three State
		set_state_sprite(s_skeleton_attack_three, 0.7,0)
		
		if animation_hit_frame(2)
		{
			create_hitbox(x, y, self,s_skeleton_attack_three_damage, 4, 4, 8, image_xscale)
		}
		
		if animation_end()
		{
			state = "move";
		}
		
		#endregion
		break;
}
