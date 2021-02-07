///scrFBSetAttackSprite(attack_sprite, image_speed, fallback_sprite[otpional], fallback_img_spd[optional])

sprite_index = argument[0];
image_speed = argument[1];
image_index = 0;

if(argument_count > 2) {
    fallback_sprite = argument[2];
}
if(argument_count > 3) {
    fallback_image_speed = argument[3];
}
