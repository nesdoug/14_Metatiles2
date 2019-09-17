/*	example code for cc65, for NES
 *  draw a BG with metatile system
 *	, also sprite collisions with BG
 *	using neslib
 *	Doug Fraker 2018
 */	
 

#include "LIB/neslib.h"
#include "LIB/nesdoug.h"
#include "Sprites.h" // holds our metasprite data
#include "metatiles2.h"





	
void main (void) {
	
	ppu_off(); // screen off
	
	// load the palettes
	pal_bg(palette_bg);
	pal_spr(palette_sp);
	
	// use the second set of tiles for sprites
	// both bg and sprites are set to 0 by default
	bank_spr(1);

	set_vram_buffer(); // do at least once, sets a pointer to a buffer
	clear_vram_buffer();
	
	load_room();
	
	set_scroll_y(0xff); // shift the bg down 1 pixel
	
	ppu_on_all(); // turn on screen
	

	while (1){
		// infinite loop
		ppu_wait_nmi(); // wait till beginning of the frame
		
		pad1 = pad_poll(0); // read the first controller
		pad1_new = get_pad_new(0); // newly pressed button. do pad_poll first
		
		clear_vram_buffer(); // do at the beginning of each frame
		
		movement();
		draw_sprites();
	}
}




void load_room(void){
	set_data_pointer(Room1);
	set_mt_pointer(metatiles1);
	for(y=0; ;y+=0x20){
		for(x=0; ;x+=0x20){
			clear_vram_buffer(); // do each frame, and before putting anything in the buffer
			address = get_ppu_addr(0, x, y);
			index = (y & 0xf0) + (x >> 4);
			buffer_4_mt(address, index); // ppu_address, index to the data
			flush_vram_update_nmi();
			if (x == 0xe0) break;
		}
		if (y == 0xe0) break;
	}
	
	
	
	// put 1 extra metatile in place
	clear_vram_buffer();
	buffer_1_mt(NTADR_A(4,4),1); //the NTADR_A macro counts tiles, not metatiles
	
//  uncomment to make the extra brick orange, by changing 1 attribute table byte
//	address = get_at_addr(0, 32, 32); // tile 4,4 = pixels 32,32
//	one_vram_buffer(0x01,address); // top left = palette 1

	//copy the room to the collision map
	memcpy (c_map, Room1, 240);
	
	c_map[0x22] = 1; //make that extra metatile solid
					 //tile 4,4 = metatile 2,2, which is position 0x22 in the collision map

	hero_y = BoxGuy1.y << 8;
	hero_x = BoxGuy1.x << 8;
}




void draw_sprites(void){
	// clear all sprites from sprite buffer
	oam_clear();
	
	// draw 1 metasprite
	if(direction == LEFT) {
		oam_meta_spr(BoxGuy1.x, BoxGuy1.y, RoundSprL);
	}
	else{
		oam_meta_spr(BoxGuy1.x, BoxGuy1.y, RoundSprR);
	}
	
	if(stick){
		//oam_spr(unsigned char x,unsigned char y,unsigned char chrnum,unsigned char attr);
		oam_spr(BoxGuy1.x+0x0f, BoxGuy1.y, 0x04, 0);
	}
}
	

	
	
void movement(void){
	// handle x
	old_x = BoxGuy1.x;
	
	if(pad1 & PAD_LEFT){
		direction = LEFT;
		if(BoxGuy1.x <= 1) {
			hero_velocity_x = 0;
			hero_x = 0x100;
		}
		else if(BoxGuy1.x < 4) { // don't want to wrap around to the other side
			hero_velocity_x = -0x100;
		}
		else {
			hero_velocity_x = -SPEED;
		}
	}
	else if (pad1 & PAD_RIGHT){
		direction = RIGHT;
		if(BoxGuy1.x >= 0xf1) {
			hero_velocity_x = 0;
			hero_x = 0xf100;
		}
		else if(BoxGuy1.x > 0xec) { // don't want to wrap around to the other side
			hero_velocity_x = 0x100;
		}
		else {
			hero_velocity_x = SPEED;
		}
	}
	else { // nothing pressed
		hero_velocity_x = 0;
	}
	
	hero_x += hero_velocity_x;
	BoxGuy1.x = hero_x >> 8; // the collision routine needs an 8 bit value
	
	L_R_switch = 1; // shinks the y values in bg_coll, less problems with head / feet collisions
	
	Generic.x = BoxGuy1.x; // this is much faster than passing a pointer to BoxGuy1
	Generic.y = BoxGuy1.y;
	Generic.width = HERO_WIDTH;
	Generic.height = HERO_HEIGHT;
	bg_collision();
	if(collision_R && collision_L){ // if both true, probably half stuck in a wall
		BoxGuy1.x = old_x;
	}
	else if(collision_L) {
		BoxGuy1.x = BoxGuy1.x - eject_L;
		
	}
	else if(collision_R) {
		BoxGuy1.x = BoxGuy1.x - eject_R;
	}
	high_byte(hero_x) = BoxGuy1.x; 

	
	
	// handle y
	old_y = BoxGuy1.y; // didn't end up using the old value

	if(pad1 & PAD_UP){
		if(BoxGuy1.y <= 1) {
			hero_velocity_y = 0;
			hero_y = 0x100;
		}
		else if(BoxGuy1.y < 4) { // don't want to wrap around to the other side
			hero_velocity_y = -0x100;
		}
		else {
			hero_velocity_y = -SPEED;
		}
	}
	else if (pad1 & PAD_DOWN){
		if(BoxGuy1.y >= 0xe0) {
			hero_velocity_y = 0;
			hero_y = 0xe000;
		}
		else if(BoxGuy1.y > 0xdc) { // don't want to wrap around to the other side
			hero_velocity_y = 0x100;
		}
		else {
			hero_velocity_y = SPEED;
		}
	}
	else { // nothing pressed
		hero_velocity_y = 0;
	}

	hero_y += hero_velocity_y;
	BoxGuy1.y = hero_y >> 8;
	// the collision routine needs an 8 bit value
	
	

	
	L_R_switch = 0;
	
	Generic.x = BoxGuy1.x; // this is much faster than passing a pointer to BoxGuy1
	Generic.y = BoxGuy1.y;
//	Generic.width = HERO_WIDTH;
//	Generic.height = HERO_HEIGHT;
	bg_collision();
	
	if(collision_U) {
		BoxGuy1.y = BoxGuy1.y - eject_U;
	}
	else if(collision_D) {
		BoxGuy1.y = BoxGuy1.y - eject_D;
		if(hero_velocity_y > 0) {
		}
	}
	high_byte(hero_y) = BoxGuy1.y;
	
	
	
	//pokey stick
	if(stick) --stick;
	
	if(pad1_new & (PAD_A|PAD_B)){
		stick = 10; // only do 10 frames worth
		break_wall();
	}
}	




void bg_collision(void){
	// note, !0 = collision
	// sprite collision with backgrounds
	// load the object's x,y,width,height to Generic, then call this
	
	// this was borrowed from a multi-screen engine, so it handles
	// high bytes on position, even though they should always be zero here
	

	collision_L = 0;
	collision_R = 0;
	collision_U = 0;
	collision_D = 0;
	
	if(Generic.y >= 0xf0) return;
	
	temp6 = temp5 = Generic.x + scroll_x; // upper left (temp6 = save for reuse)
	temp1 = temp5 & 0xff; // low byte x
	temp2 = temp5 >> 8; // high byte x
	
	eject_L = temp1 | 0xf0;
	
	temp3 = Generic.y; // y top
	
	eject_U = temp3 | 0xf0;
	
	if(L_R_switch) temp3 += 2; // fix bug, walking through walls
	
	bg_collision_sub();
	
	if(collision){ // find a corner in the collision map
		++collision_L;
		++collision_U;
	}
	
	// upper right
	temp5 += Generic.width;
	temp1 = temp5 & 0xff; // low byte x
	temp2 = temp5 >> 8; // high byte x
	
	eject_R = (temp1 + 1) & 0x0f;
	
	// temp3 is unchanged
	bg_collision_sub();
	
	if(collision){ // find a corner in the collision map
		++collision_R;
		++collision_U;
	}
	
	
	// again, lower
	
	// bottom right, x hasn't changed

	temp3 = Generic.y + Generic.height; //y bottom
	if(L_R_switch) temp3 -= 2; // fix bug, walking through walls
	eject_D = (temp3 + 1) & 0x0f;
	if(temp3 >= 0xf0) return;
	
	bg_collision_sub();
	
	if(collision){ // find a corner in the collision map
		++collision_R;
		++collision_D;
	}
	
	// bottom left
	temp1 = temp6 & 0xff; // low byte x
	temp2 = temp6 >> 8; // high byte x
	
	//temp3, y is unchanged

	bg_collision_sub();
	
	if(collision){ // find a corner in the collision map
		++collision_L;
		++collision_D;
	}
}



void bg_collision_sub(void){
// this was borrowed from a multi-screen engine
// c_map2 should never be used here
	coordinates = (temp1 >> 4) + (temp3 & 0xf0); // upper left
	
	map = temp2&1; // high byte
	if(!map){
		collision = c_map[coordinates];
	}
	else{
		collision = c_map2[coordinates];
	}
}



void break_wall(void){
	temp1 = BoxGuy1.x + 0x16;
	temp2 = BoxGuy1.y + 5;
	coordinates = (temp1>>4) + (temp2 & 0xf0);
	if(c_map[coordinates] == 1){ // if brick
		c_map[coordinates] = 0; // can walk through it
		address = get_ppu_addr(0, temp1, temp2);
		buffer_1_mt(address, 0); // put metatile #0 here = blank grass
	}
}


