/// @description Insert description here
// You can write your code in this editor

//main ui draw
draw_self();

//draw key count
draw_set_font(fnt_big);
draw_text(x+133,y+3,global.keyCount);

//draw heart count
var healthNum = global.health;
var heartID = 0;

for(var i = 0; i < global.maxHealth; i++)
{
	if(i % 2 == 0)
	{
		nextHealthPos[0] = x + 1 + i*4;
		nextHealthPos[1] = y + 1
		
		//moves hearts to the second row after 4 have been drawn
		if(i>7)
		{
			nextHealthPos[0] -= 32;
			nextHealthPos[1] += 7;
		}
		if(healthNum <= 0)
			heartID = 2;
		else if(healthNum < 2)
			heartID = 1;
		else
			heartID = 0;
			
		draw_sprite(spr_heart, heartID, nextHealthPos[0], nextHealthPos[1])	
		
	}	
	healthNum--;
}

//draw big key status

//draws the fragments, offset to align properly
if(global.piece[0])
	draw_sprite(spr_bigkey0,0,x+144+3,y+tileSize);
if(global.piece[1])
	draw_sprite(spr_bigkey1,0,x+144+9,y-1+tileSize);
if(global.piece[2])
	draw_sprite(spr_bigkey2,0,x+144+13,y-1+tileSize);