/// @description Insert description here
// You can write your code in this editor

//initially hides textbox, but also puts it at a "high" depth making sure it shows over everything else
//visible = false; 
depth = -12000;

//saves a global to easily access textbox
global.textBox = self;

//offset variable, changes based on textboxes y location
m_Yoffset = -32;

//variable for tracking dialogue being displayed, initialized to ""
m_dialogueCurr = "";

//tracks state of textbox, 0 is hidden, 1 is showing
m_dialogueDirection = 0;

//movement required for textbox
m_dialogueMove = tileSize*2/(room_speed/2);

//Dialogue string for main room NPC, adapts depending on what key pieces are collected by using a list
m_dialogueString = "Unset";
m_dialogueList = ds_list_create();

//2d array holding the various dialogue options, with the first arg corresponding to NPC id,
//and the second corresponding to gamestate.
m_dialogueArray[1][0] = m_dialogueString;
m_dialogueArray[1][1] = "The crystal is to the north.";
m_dialogueArray[2][0] = "Should not be accessible.";
m_dialogueArray[2][1] = "You made it! Collect the crystal to escape.";