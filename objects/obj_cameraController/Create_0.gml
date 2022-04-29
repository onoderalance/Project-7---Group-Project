/// @description Insert description here
// You can write your code in this editor

//defines itself as a global for easy access
global.cameraController = self;

//constants to help define room locations
#macro roomHeight 128
#macro roomWidth 160

//game is based on 16px tiles, constant defined to represent that
#macro tileSize 16

// variables to help with movement/camera panning
m_xmove = 0;
m_ymove = 0;
m_movementTimer = -1;