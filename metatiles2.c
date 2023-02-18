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
	
	load_room();
	
	set_scroll_y(0xff); // shift the bg down 1 pixel
	
	ppu_on_all(); // turn on screen
	

	while (1){
		// infinite loop
		ppu_wait_nmi(); // wait till beginning of the frame
		
		pad1 = pad_poll(0); // read the first controller
		pad1_new = get_pad_new(0); // newly pressed button. do pad_poll first
		
		movement();
		draw_sprites();
	}
}




void load_room(void){
	set_data_pointer(Room1);
	set_mt_pointer(metatiles1);
	for(y=0; ;y+=0x20){
		for(x=0; ;x+=0x20){
			address = get_ppu_addr(0, x, y);
			index = (y & 0xf0) + (x >> 4);
			buffer_4_mt(address, index); // ppu_address, index to the data
			flush_vram_update2();
			if (x == 0xe0) break;
		}
		if (y == 0xe0) break;
	}
	
	
	
	// put 1 extra metatile in place
	buffer_1_mt(NTADR_A(4,4),1); //the NTADR_A macro counts tiles, not metatiles
	
//  uncomment to make the extra brick orange, by changing 1 attribute table byte
//	address = get_at_addr(0, 32, 32); // tile 4,4 = pixels 32,32
//	one_vram_buffer(0x01,address); // top left = palette 1

	//copy the room to the collision map
	memcpy (c_map, Room1, 240);
	
	c_map[0x22] = 1; //make that extra metatile solid
					 //tile 4,4 = metatile 2,2, which is position 0x22 in the collision map

	
	//BoxGuy1.x and BoxGuy1.y already defined in metatiles.h
}




void draw_sprites(void){
	// clear all sprites from sprite buffer
	oam_clear();
	
	temp_x = BoxGuy1.x >> 8;
	temp_y = BoxGuy1.y >> 8;
	if(temp_x == 0) temp_x = 1;
	if(temp_y == 0) temp_y = 1;
	
	// draw 1 metasprite
	if(direction == LEFT) {
		oam_meta_spr(temp_x, temp_y, RoundSprL);
	}
	else{
		oam_meta_spr(temp_x, temp_y, RoundSprR);
	}
	
	if(stick){
		//oam_spr(unsigned char x,unsigned char y,unsigned char chrnum,unsigned char attr);
		oam_spr(temp_x+0x0f, temp_y, 0x04, 0);
	}
}
	

	
	
void movement(void){
	// handle x
	old_x = BoxGuy1.x;
	
	if(pad1 & PAD_LEFT){
		direction = LEFT;
		hero_velocity_x = -SPEED;
	}
	else if (pad1 & PAD_RIGHT){
		direction = RIGHT;
		hero_velocity_x = SPEED;
	}
	else { // nothing pressed
		hero_velocity_x = 0;
	}
	
	BoxGuy1.x += hero_velocity_x;
	
	if(BoxGuy1.x > 0xf100) { // too far, don't wrap around
        
        if(old_x >= 0x8000){
            BoxGuy1.x = 0xf100; // max right
        }
        else{
            BoxGuy1.x = 0x0000; // max left
        }
        
	} 
	
	
	Generic.x = BoxGuy1.x >> 8; // the collision routine needs an 8 bit value
	Generic.y = BoxGuy1.y >> 8;
	Generic.width = HERO_WIDTH;
	Generic.height = HERO_HEIGHT;
	
	if(hero_velocity_x < 0){ // going left
		if(bg_coll_L() ){ // check collision left
            high_byte(BoxGuy1.x) = high_byte(BoxGuy1.x) - eject_L;
            
        }
	}
	else if(hero_velocity_x > 0){ // going right
		if(bg_coll_R() ){ // check collision right
            high_byte(BoxGuy1.x) = high_byte(BoxGuy1.x) - eject_R;
            
        }
	}
	// else 0, skip it
	
	
	
	// handle y
	old_y = BoxGuy1.y;

	if(pad1 & PAD_UP){
		hero_velocity_y = -SPEED;
	}
	else if (pad1 & PAD_DOWN){
		hero_velocity_y = SPEED;
	}
	else { // nothing pressed
		hero_velocity_y = 0;
	}

	BoxGuy1.y += hero_velocity_y;
	
	if(BoxGuy1.y > 0xe000) { // too far, don't wrap around
        
        if(old_y >= 0x8000){
            BoxGuy1.y = 0xe000; // max down
        }
        else{
            BoxGuy1.y = 0x0000; // max up
        }
        
	} 
	
	Generic.x = BoxGuy1.x >> 8; // the collision routine needs an 8 bit value
	Generic.y = BoxGuy1.y >> 8;
//	Generic.width = HERO_WIDTH; // already is this
//	Generic.height = HERO_HEIGHT;
	
	if(hero_velocity_y < 0){ // going up
		if(bg_coll_U() ){ // check collision left
            high_byte(BoxGuy1.y) = high_byte(BoxGuy1.y) - eject_U;
            
        }
	}
	else if(hero_velocity_y > 0){ // going down
		if(bg_coll_D() ){ // check collision right
            high_byte(BoxGuy1.y) = high_byte(BoxGuy1.y) - eject_D;
            
        }
	}
	// else 0, skip it
	
	
	
	//pokey stick
	if(stick) --stick;
	
	if(pad1_new & (PAD_A|PAD_B)){
		stick = 10; // only do 10 frames worth
		break_wall();
	}
}	



char bg_coll_L(void){
    // check 2 points on the left side
    temp_x = Generic.x;
    
    eject_L = temp_x | 0xf0;
    temp_y = Generic.y + 2;
    if(bg_collision_sub() ) return 1;
    
    temp_y = Generic.y + Generic.height;
    temp_y -= 2;
    if(bg_collision_sub() ) return 1;
    
    return 0;
}

char bg_coll_R(void){
    // check 2 points on the right side
    temp_x = Generic.x + Generic.width;
    
    eject_R = (temp_x + 1) & 0x0f;
    temp_y = Generic.y + 2;
    if(bg_collision_sub() ) return 1;
    
    temp_y = Generic.y + Generic.height;
    temp_y -= 2;
    if(bg_collision_sub() ) return 1;
    
    return 0;
}

char bg_coll_U(void){
    // check 2 points on the top side
    temp_x = Generic.x + 2;
    
    temp_y = Generic.y;
    eject_U = temp_y | 0xf0;
    if(bg_collision_sub() ) return 1;
    
    temp_x = Generic.x + Generic.width;
    temp_x -= 2;

    if(bg_collision_sub() ) return 1;
    
    return 0;
}

char bg_coll_D(void){
    // check 2 points on the bottom side
    temp_x = Generic.x + 2;

    temp_y = Generic.y + Generic.height;
    eject_D = (temp_y + 1) & 0x0f;
    if(bg_collision_sub() ) return 1;
    
    temp_x = Generic.x + Generic.width;
    temp_x -= 2;

    if(bg_collision_sub() ) return 1;
    
    return 0;
}



char bg_collision_sub(void){
	if(temp_y >= 0xf0) return 0;
	
	coordinates = (temp_x >> 4) + (temp_y & 0xf0);
	
	collision = c_map[coordinates];
	
	return collision;
}




void break_wall(void){
	temp_x = BoxGuy1.x >> 8;
	temp_x += 0x16;
	temp_y = BoxGuy1.y >> 8;
	temp_y += 5;
	coordinates = (temp_x>>4) + (temp_y & 0xf0);
	if(c_map[coordinates] == 1){ // if brick
		c_map[coordinates] = 0; // can walk through it
		address = get_ppu_addr(0, temp_x, temp_y);
		buffer_1_mt(address, 0); // put metatile #0 here = blank grass
	}
}


