/// @description Insert description here
// You can write your code in this editor

//array of sprites allowing each fragment with unique id to appear uniquely
m_spriteArray[0] = spr_bigkey0;
m_spriteArray[1] = spr_bigkey1;
m_spriteArray[2] = spr_bigkey2;

sprite_index = m_spriteArray[keyID];

m_keyTimer = 0;

//state of key sprite vertically, false is down, true is up
m_keyState = false;

//vars tracking where sprite is drawn
m_keyX = x;
m_keyY = y;
