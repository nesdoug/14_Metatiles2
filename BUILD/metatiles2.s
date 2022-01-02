;
; File generated by cc65 v 2.18 - Git c0a873e
;
	.fopt		compiler,"cc65 v 2.18 - Git c0a873e"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_nmi
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_oam_clear
	.import		_oam_spr
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_spr
	.import		_memcpy
	.import		_set_vram_buffer
	.import		_get_pad_new
	.import		_set_scroll_y
	.import		_get_ppu_addr
	.import		_set_data_pointer
	.import		_set_mt_pointer
	.import		_buffer_1_mt
	.import		_buffer_4_mt
	.import		_flush_vram_update2
	.export		_RoundSprL
	.export		_RoundSprR
	.export		_pad1
	.export		_pad1_new
	.export		_collision
	.export		_collision_L
	.export		_collision_R
	.export		_collision_U
	.export		_collision_D
	.export		_coordinates
	.export		_temp1
	.export		_temp2
	.export		_temp3
	.export		_temp4
	.export		_temp5
	.export		_temp6
	.export		_eject_L
	.export		_eject_R
	.export		_eject_D
	.export		_eject_U
	.export		_direction
	.export		_address
	.export		_x
	.export		_y
	.export		_index
	.export		_map
	.export		_scroll_x
	.export		_scroll_y
	.export		_hero_velocity_x
	.export		_hero_velocity_y
	.export		_hero_x
	.export		_hero_y
	.export		_L_R_switch
	.export		_old_x
	.export		_old_y
	.export		_stick
	.export		_c_map
	.export		_c_map2
	.export		_Generic
	.export		_BoxGuy1
	.export		_palette_bg
	.export		_palette_sp
	.export		_metatiles1
	.export		_Room1
	.export		_load_room
	.export		_draw_sprites
	.export		_movement
	.export		_bg_collision
	.export		_bg_collision_sub
	.export		_break_wall
	.export		_main

.segment	"DATA"

_BoxGuy1:
	.byte	$40
	.byte	$30

.segment	"RODATA"

_RoundSprL:
	.byte	$FF
	.byte	$FF
	.byte	$02
	.byte	$00
	.byte	$07
	.byte	$FF
	.byte	$03
	.byte	$00
	.byte	$FF
	.byte	$07
	.byte	$12
	.byte	$00
	.byte	$07
	.byte	$07
	.byte	$13
	.byte	$00
	.byte	$80
_RoundSprR:
	.byte	$FF
	.byte	$FF
	.byte	$00
	.byte	$00
	.byte	$07
	.byte	$FF
	.byte	$01
	.byte	$00
	.byte	$FF
	.byte	$07
	.byte	$10
	.byte	$00
	.byte	$07
	.byte	$07
	.byte	$11
	.byte	$00
	.byte	$80
_palette_bg:
	.byte	$19
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$19
	.byte	$07
	.byte	$17
	.byte	$27
	.byte	$19
	.byte	$02
	.byte	$12
	.byte	$22
	.byte	$19
	.byte	$09
	.byte	$19
	.byte	$29
_palette_sp:
	.byte	$0F
	.byte	$07
	.byte	$28
	.byte	$38
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_metatiles1:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$03
	.byte	$04
	.byte	$04
	.byte	$04
	.byte	$04
	.byte	$01
	.byte	$09
	.byte	$09
	.byte	$09
	.byte	$09
	.byte	$02
	.byte	$05
	.byte	$06
	.byte	$08
	.byte	$07
	.byte	$01
	.byte	$05
	.byte	$06
	.byte	$08
	.byte	$07
	.byte	$00
_Room1:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00

.segment	"BSS"

.segment	"ZEROPAGE"
_pad1:
	.res	1,$00
_pad1_new:
	.res	1,$00
_collision:
	.res	1,$00
_collision_L:
	.res	1,$00
_collision_R:
	.res	1,$00
_collision_U:
	.res	1,$00
_collision_D:
	.res	1,$00
_coordinates:
	.res	1,$00
_temp1:
	.res	1,$00
_temp2:
	.res	1,$00
_temp3:
	.res	1,$00
_temp4:
	.res	1,$00
_temp5:
	.res	2,$00
_temp6:
	.res	2,$00
_eject_L:
	.res	1,$00
_eject_R:
	.res	1,$00
_eject_D:
	.res	1,$00
_eject_U:
	.res	1,$00
_direction:
	.res	1,$00
_address:
	.res	2,$00
_x:
	.res	1,$00
_y:
	.res	1,$00
_index:
	.res	1,$00
_map:
	.res	1,$00
_scroll_x:
	.res	2,$00
_scroll_y:
	.res	2,$00
_hero_velocity_x:
	.res	2,$00
_hero_velocity_y:
	.res	2,$00
_hero_x:
	.res	2,$00
_hero_y:
	.res	2,$00
_L_R_switch:
	.res	1,$00
_old_x:
	.res	1,$00
_old_y:
	.res	1,$00
_stick:
	.res	1,$00
.segment	"BSS"
_c_map:
	.res	240,$00
_c_map2:
	.res	240,$00
_Generic:
	.res	4,$00

; ---------------------------------------------------------------
; void __near__ load_room (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_load_room: near

.segment	"CODE"

;
; set_data_pointer(Room1);
;
	lda     #<(_Room1)
	ldx     #>(_Room1)
	jsr     _set_data_pointer
;
; set_mt_pointer(metatiles1);
;
	lda     #<(_metatiles1)
	ldx     #>(_metatiles1)
	jsr     _set_mt_pointer
;
; for(y=0; ;y+=0x20){
;
	lda     #$00
L02CA:	sta     _y
;
; for(x=0; ;x+=0x20){
;
	lda     #$00
L02C9:	sta     _x
;
; address = get_ppu_addr(0, x, y);
;
	jsr     decsp2
	lda     #$00
	ldy     #$01
	sta     (sp),y
	lda     _x
	dey
	sta     (sp),y
	lda     _y
	jsr     _get_ppu_addr
	sta     _address
	stx     _address+1
;
; index = (y & 0xf0) + (x >> 4);
;
	lda     _y
	and     #$F0
	sta     ptr1
	lda     _x
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	clc
	adc     ptr1
	sta     _index
;
; buffer_4_mt(address, index); // ppu_address, index to the data
;
	lda     _address
	ldx     _address+1
	jsr     pushax
	lda     _index
	jsr     _buffer_4_mt
;
; flush_vram_update2();
;
	jsr     _flush_vram_update2
;
; if (x == 0xe0) break;
;
	lda     _x
	cmp     #$E0
	beq     L02CB
;
; for(x=0; ;x+=0x20){
;
	lda     #$20
	clc
	adc     _x
	jmp     L02C9
;
; if (y == 0xe0) break;
;
L02CB:	lda     _y
	cmp     #$E0
	beq     L0172
;
; for(y=0; ;y+=0x20){
;
	lda     #$20
	clc
	adc     _y
	jmp     L02CA
;
; buffer_1_mt(NTADR_A(4,4),1); //the NTADR_A macro counts tiles, not metatiles
;
L0172:	ldx     #$20
	lda     #$84
	jsr     pushax
	lda     #$01
	jsr     _buffer_1_mt
;
; memcpy (c_map, Room1, 240);
;
	ldy     #$00
L019E:	lda     _Room1,y
	sta     _c_map,y
	iny
	cpy     #$F0
	bne     L019E
;
; c_map[0x22] = 1; //make that extra metatile solid
;
	lda     #$01
	sta     _c_map+34
;
; hero_y = BoxGuy1.y << 8;
;
	lda     _BoxGuy1+1
	sta     _hero_y+1
	lda     #$00
	sta     _hero_y
;
; hero_x = BoxGuy1.x << 8;
;
	lda     _BoxGuy1
	sta     _hero_x+1
	lda     #$00
	sta     _hero_x
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ draw_sprites (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_draw_sprites: near

.segment	"CODE"

;
; oam_clear();
;
	jsr     _oam_clear
;
; if(direction == LEFT) {
;
	lda     _direction
	bne     L01A8
;
; oam_meta_spr(BoxGuy1.x, BoxGuy1.y, RoundSprL);
;
	jsr     decsp2
	lda     _BoxGuy1
	ldy     #$01
	sta     (sp),y
	lda     _BoxGuy1+1
	dey
	sta     (sp),y
	lda     #<(_RoundSprL)
	ldx     #>(_RoundSprL)
;
; else{
;
	jmp     L02CC
;
; oam_meta_spr(BoxGuy1.x, BoxGuy1.y, RoundSprR);
;
L01A8:	jsr     decsp2
	lda     _BoxGuy1
	ldy     #$01
	sta     (sp),y
	lda     _BoxGuy1+1
	dey
	sta     (sp),y
	lda     #<(_RoundSprR)
	ldx     #>(_RoundSprR)
L02CC:	jsr     _oam_meta_spr
;
; if(stick){
;
	lda     _stick
	beq     L01B3
;
; oam_spr(BoxGuy1.x+0x0f, BoxGuy1.y, 0x04, 0);
;
	jsr     decsp3
	lda     _BoxGuy1
	clc
	adc     #$0F
	ldy     #$02
	sta     (sp),y
	lda     _BoxGuy1+1
	dey
	sta     (sp),y
	lda     #$04
	dey
	sta     (sp),y
	tya
	jmp     _oam_spr
;
; }
;
L01B3:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ movement (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_movement: near

.segment	"CODE"

;
; old_x = BoxGuy1.x;
;
	lda     _BoxGuy1
	sta     _old_x
;
; if(pad1 & PAD_LEFT){
;
	lda     _pad1
	and     #$02
	beq     L02D1
;
; direction = LEFT;
;
	lda     #$00
	sta     _direction
;
; if(BoxGuy1.x <= 1) {
;
	lda     _BoxGuy1
	cmp     #$02
	bcs     L02D0
;
; hero_velocity_x = 0;
;
	lda     #$00
	sta     _hero_velocity_x
	sta     _hero_velocity_x+1
;
; hero_x = 0x100;
;
	ldx     #$01
	sta     _hero_x
	stx     _hero_x+1
;
; else if(BoxGuy1.x < 4) { // don't want to wrap around to the other side
;
	jmp     L01E3
L02D0:	lda     _BoxGuy1
	cmp     #$04
	bcs     L01C9
;
; hero_velocity_x = -0x100;
;
	ldx     #$FF
	lda     #$00
;
; else {
;
	jmp     L02D4
;
; hero_velocity_x = -SPEED;
;
L01C9:	ldx     #$FE
;
; else if (pad1 & PAD_RIGHT){
;
	jmp     L02DE
L02D1:	lda     _pad1
	ldx     #$00
	and     #$01
	beq     L02D4
;
; direction = RIGHT;
;
	lda     #$01
	sta     _direction
;
; if(BoxGuy1.x >= 0xf1) {
;
	lda     _BoxGuy1
	cmp     #$F1
	bcc     L02D2
;
; hero_velocity_x = 0;
;
	txa
	sta     _hero_velocity_x
	sta     _hero_velocity_x+1
;
; hero_x = 0xf100;
;
	ldx     #$F1
	sta     _hero_x
	stx     _hero_x+1
;
; else if(BoxGuy1.x > 0xec) { // don't want to wrap around to the other side
;
	jmp     L01E3
L02D2:	lda     _BoxGuy1
	cmp     #$ED
	bcc     L01DC
;
; hero_velocity_x = 0x100;
;
	inx
	lda     #$00
;
; else {
;
	jmp     L02D4
;
; hero_velocity_x = SPEED;
;
L01DC:	inx
L02DE:	lda     #$80
;
; hero_velocity_x = 0;
;
L02D4:	sta     _hero_velocity_x
	stx     _hero_velocity_x+1
;
; hero_x += hero_velocity_x;
;
L01E3:	lda     _hero_velocity_x
	clc
	adc     _hero_x
	sta     _hero_x
	lda     _hero_velocity_x+1
	adc     _hero_x+1
	sta     _hero_x+1
;
; BoxGuy1.x = hero_x >> 8; // the collision routine needs an 8 bit value
;
	sta     _BoxGuy1
;
; L_R_switch = 1; // shinks the y values in bg_coll, less problems with head / feet collisions
;
	lda     #$01
	sta     _L_R_switch
;
; Generic.x = BoxGuy1.x; // this is much faster than passing a pointer to BoxGuy1
;
	lda     _BoxGuy1
	sta     _Generic
;
; Generic.y = BoxGuy1.y;
;
	lda     _BoxGuy1+1
	sta     _Generic+1
;
; Generic.width = HERO_WIDTH;
;
	lda     #$0D
	sta     _Generic+2
;
; Generic.height = HERO_HEIGHT;
;
	sta     _Generic+3
;
; bg_collision();
;
	jsr     _bg_collision
;
; if(collision_R && collision_L){ // if both true, probably half stuck in a wall
;
	lda     _collision_R
	beq     L01F5
	lda     _collision_L
	beq     L01F5
;
; BoxGuy1.x = old_x;
;
	lda     _old_x
;
; else if(collision_L) {
;
	jmp     L02CE
L01F5:	lda     _collision_L
	beq     L01FC
;
; BoxGuy1.x = BoxGuy1.x - eject_L;
;
	lda     _BoxGuy1
	sec
	sbc     _eject_L
;
; else if(collision_R) {
;
	jmp     L02CE
L01FC:	lda     _collision_R
	beq     L02D5
;
; BoxGuy1.x = BoxGuy1.x - eject_R;
;
	lda     _BoxGuy1
	sec
	sbc     _eject_R
L02CE:	sta     _BoxGuy1
;
; high_byte(hero_x) = BoxGuy1.x; 
;
L02D5:	lda     _BoxGuy1
	sta     _hero_x+1
;
; old_y = BoxGuy1.y; // didn't end up using the old value
;
	lda     _BoxGuy1+1
	sta     _old_y
;
; if(pad1 & PAD_UP){
;
	lda     _pad1
	and     #$08
	beq     L02D7
;
; if(BoxGuy1.y <= 1) {
;
	lda     _BoxGuy1+1
	cmp     #$02
	bcs     L02D6
;
; hero_velocity_y = 0;
;
	lda     #$00
	sta     _hero_velocity_y
	sta     _hero_velocity_y+1
;
; hero_y = 0x100;
;
	ldx     #$01
	sta     _hero_y
	stx     _hero_y+1
;
; else if(BoxGuy1.y < 4) { // don't want to wrap around to the other side
;
	jmp     L022B
L02D6:	lda     _BoxGuy1+1
	cmp     #$04
	bcs     L0213
;
; hero_velocity_y = -0x100;
;
	ldx     #$FF
	lda     #$00
;
; else {
;
	jmp     L02DA
;
; hero_velocity_y = -SPEED;
;
L0213:	ldx     #$FE
;
; else if (pad1 & PAD_DOWN){
;
	jmp     L02E0
L02D7:	lda     _pad1
	ldx     #$00
	and     #$04
	beq     L02DA
;
; if(BoxGuy1.y >= 0xe0) {
;
	lda     _BoxGuy1+1
	cmp     #$E0
	bcc     L02D8
;
; hero_velocity_y = 0;
;
	txa
	sta     _hero_velocity_y
	sta     _hero_velocity_y+1
;
; hero_y = 0xe000;
;
	ldx     #$E0
	sta     _hero_y
	stx     _hero_y+1
;
; else if(BoxGuy1.y > 0xdc) { // don't want to wrap around to the other side
;
	jmp     L022B
L02D8:	lda     _BoxGuy1+1
	cmp     #$DD
	bcc     L0224
;
; hero_velocity_y = 0x100;
;
	inx
	lda     #$00
;
; else {
;
	jmp     L02DA
;
; hero_velocity_y = SPEED;
;
L0224:	inx
L02E0:	lda     #$80
;
; hero_velocity_y = 0;
;
L02DA:	sta     _hero_velocity_y
	stx     _hero_velocity_y+1
;
; hero_y += hero_velocity_y;
;
L022B:	lda     _hero_velocity_y
	clc
	adc     _hero_y
	sta     _hero_y
	lda     _hero_velocity_y+1
	adc     _hero_y+1
	sta     _hero_y+1
;
; BoxGuy1.y = hero_y >> 8;
;
	sta     _BoxGuy1+1
;
; L_R_switch = 0;
;
	lda     #$00
	sta     _L_R_switch
;
; Generic.x = BoxGuy1.x; // this is much faster than passing a pointer to BoxGuy1
;
	lda     _BoxGuy1
	sta     _Generic
;
; Generic.y = BoxGuy1.y;
;
	lda     _BoxGuy1+1
	sta     _Generic+1
;
; bg_collision();
;
	jsr     _bg_collision
;
; if(collision_U) {
;
	lda     _collision_U
	beq     L0239
;
; BoxGuy1.y = BoxGuy1.y - eject_U;
;
	lda     _BoxGuy1+1
	sec
	sbc     _eject_U
	sta     _BoxGuy1+1
;
; else if(collision_D) {
;
	jmp     L02DB
L0239:	lda     _collision_D
	beq     L02DB
;
; BoxGuy1.y = BoxGuy1.y - eject_D;
;
	lda     _BoxGuy1+1
	sec
	sbc     _eject_D
	sta     _BoxGuy1+1
;
; if(hero_velocity_y > 0) {
;
	lda     _hero_velocity_y
	cmp     #$01
	lda     _hero_velocity_y+1
	sbc     #$00
	bvs     L0244
	eor     #$80
L0244:	asl     a
	lda     #$00
	rol     a
;
; high_byte(hero_y) = BoxGuy1.y;
;
L02DB:	lda     _BoxGuy1+1
	sta     _hero_y+1
;
; if(stick) --stick;
;
	lda     _stick
	beq     L02DC
	dec     _stick
;
; if(pad1_new & (PAD_A|PAD_B)){
;
L02DC:	lda     _pad1_new
	and     #$C0
	beq     L024B
;
; stick = 10; // only do 10 frames worth
;
	lda     #$0A
	sta     _stick
;
; break_wall();
;
	jmp     _break_wall
;
; } 
;
L024B:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ bg_collision (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_bg_collision: near

.segment	"CODE"

;
; collision_L = 0;
;
	lda     #$00
	sta     _collision_L
;
; collision_R = 0;
;
	sta     _collision_R
;
; collision_U = 0;
;
	sta     _collision_U
;
; collision_D = 0;
;
	sta     _collision_D
;
; if(Generic.y >= 0xf0) return;
;
	lda     _Generic+1
	cmp     #$F0
	bcc     L02E3
;
; }
;
	rts
;
; temp6 = temp5 = Generic.x + scroll_x; // upper left (temp6 = save for reuse)
;
L02E3:	lda     _Generic
	clc
	adc     _scroll_x
	pha
	lda     #$00
	adc     _scroll_x+1
	tax
	pla
	sta     _temp5
	stx     _temp5+1
	sta     _temp6
	stx     _temp6+1
;
; temp1 = temp5 & 0xff; // low byte x
;
	lda     _temp5
	sta     _temp1
;
; temp2 = temp5 >> 8; // high byte x
;
	lda     _temp5+1
	sta     _temp2
;
; eject_L = temp1 | 0xf0;
;
	lda     _temp1
	ora     #$F0
	sta     _eject_L
;
; temp3 = Generic.y; // y top
;
	lda     _Generic+1
	sta     _temp3
;
; eject_U = temp3 | 0xf0;
;
	ora     #$F0
	sta     _eject_U
;
; if(L_R_switch) temp3 += 2; // fix bug, walking through walls
;
	lda     _L_R_switch
	beq     L0269
	lda     #$02
	clc
	adc     _temp3
	sta     _temp3
;
; bg_collision_sub();
;
L0269:	jsr     _bg_collision_sub
;
; if(collision){ // find a corner in the collision map
;
	lda     _collision
	beq     L026E
;
; ++collision_L;
;
	inc     _collision_L
;
; ++collision_U;
;
	inc     _collision_U
;
; temp5 += Generic.width;
;
L026E:	lda     _Generic+2
	clc
	adc     _temp5
	sta     _temp5
	lda     #$00
	adc     _temp5+1
	sta     _temp5+1
;
; temp1 = temp5 & 0xff; // low byte x
;
	lda     _temp5
	sta     _temp1
;
; temp2 = temp5 >> 8; // high byte x
;
	lda     _temp5+1
	sta     _temp2
;
; eject_R = (temp1 + 1) & 0x0f;
;
	lda     _temp1
	clc
	adc     #$01
	and     #$0F
	sta     _eject_R
;
; bg_collision_sub();
;
	jsr     _bg_collision_sub
;
; if(collision){ // find a corner in the collision map
;
	lda     _collision
	beq     L027D
;
; ++collision_R;
;
	inc     _collision_R
;
; ++collision_U;
;
	inc     _collision_U
;
; temp3 = Generic.y + Generic.height; //y bottom
;
L027D:	lda     _Generic+1
	clc
	adc     _Generic+3
	sta     _temp3
;
; if(L_R_switch) temp3 -= 2; // fix bug, walking through walls
;
	lda     _L_R_switch
	beq     L02E2
	lda     _temp3
	sec
	sbc     #$02
	sta     _temp3
;
; eject_D = (temp3 + 1) & 0x0f;
;
L02E2:	lda     _temp3
	clc
	adc     #$01
	and     #$0F
	sta     _eject_D
;
; if(temp3 >= 0xf0) return;
;
	lda     _temp3
	cmp     #$F0
	bcs     L0297
;
; bg_collision_sub();
;
	jsr     _bg_collision_sub
;
; if(collision){ // find a corner in the collision map
;
	lda     _collision
	beq     L028E
;
; ++collision_R;
;
	inc     _collision_R
;
; ++collision_D;
;
	inc     _collision_D
;
; temp1 = temp6 & 0xff; // low byte x
;
L028E:	lda     _temp6
	sta     _temp1
;
; temp2 = temp6 >> 8; // high byte x
;
	lda     _temp6+1
	sta     _temp2
;
; bg_collision_sub();
;
	jsr     _bg_collision_sub
;
; if(collision){ // find a corner in the collision map
;
	lda     _collision
	beq     L0297
;
; ++collision_L;
;
	inc     _collision_L
;
; ++collision_D;
;
	inc     _collision_D
;
; }
;
L0297:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ bg_collision_sub (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_bg_collision_sub: near

.segment	"CODE"

;
; coordinates = (temp1 >> 4) + (temp3 & 0xf0); // upper left
;
	lda     _temp1
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _temp3
	and     #$F0
	clc
	adc     ptr1
	sta     _coordinates
;
; map = temp2&1; // high byte
;
	lda     _temp2
	and     #$01
	sta     _map
;
; if(!map){
;
	lda     _map
	bne     L02A2
;
; collision = c_map[coordinates];
;
	ldy     _coordinates
	lda     _c_map,y
;
; else{
;
	jmp     L02E5
;
; collision = c_map2[coordinates];
;
L02A2:	ldy     _coordinates
	lda     _c_map2,y
L02E5:	sta     _collision
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ break_wall (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_break_wall: near

.segment	"CODE"

;
; temp1 = BoxGuy1.x + 0x16;
;
	lda     _BoxGuy1
	clc
	adc     #$16
	sta     _temp1
;
; temp2 = BoxGuy1.y + 5;
;
	lda     _BoxGuy1+1
	clc
	adc     #$05
	sta     _temp2
;
; coordinates = (temp1>>4) + (temp2 & 0xf0);
;
	lda     _temp1
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _temp2
	and     #$F0
	clc
	adc     ptr1
	sta     _coordinates
;
; if(c_map[coordinates] == 1){ // if brick
;
	ldy     _coordinates
	lda     _c_map,y
	cmp     #$01
	bne     L02B8
;
; c_map[coordinates] = 0; // can walk through it
;
	ldy     _coordinates
	lda     #$00
	sta     _c_map,y
;
; address = get_ppu_addr(0, temp1, temp2);
;
	jsr     decsp2
	lda     #$00
	ldy     #$01
	sta     (sp),y
	lda     _temp1
	dey
	sta     (sp),y
	lda     _temp2
	jsr     _get_ppu_addr
	sta     _address
	stx     _address+1
;
; buffer_1_mt(address, 0); // put metatile #0 here = blank grass
;
	jsr     pushax
	lda     #$00
	jmp     _buffer_1_mt
;
; }
;
L02B8:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; ppu_off(); // screen off
;
	jsr     _ppu_off
;
; pal_bg(palette_bg);
;
	lda     #<(_palette_bg)
	ldx     #>(_palette_bg)
	jsr     _pal_bg
;
; pal_spr(palette_sp);
;
	lda     #<(_palette_sp)
	ldx     #>(_palette_sp)
	jsr     _pal_spr
;
; bank_spr(1);
;
	lda     #$01
	jsr     _bank_spr
;
; set_vram_buffer(); // do at least once, sets a pointer to a buffer
;
	jsr     _set_vram_buffer
;
; load_room();
;
	jsr     _load_room
;
; set_scroll_y(0xff); // shift the bg down 1 pixel
;
	ldx     #$00
	lda     #$FF
	jsr     _set_scroll_y
;
; ppu_on_all(); // turn on screen
;
	jsr     _ppu_on_all
;
; ppu_wait_nmi(); // wait till beginning of the frame
;
L015F:	jsr     _ppu_wait_nmi
;
; pad1 = pad_poll(0); // read the first controller
;
	lda     #$00
	jsr     _pad_poll
	sta     _pad1
;
; pad1_new = get_pad_new(0); // newly pressed button. do pad_poll first
;
	lda     #$00
	jsr     _get_pad_new
	sta     _pad1_new
;
; movement();
;
	jsr     _movement
;
; draw_sprites();
;
	jsr     _draw_sprites
;
; while (1){
;
	jmp     L015F

.endproc

