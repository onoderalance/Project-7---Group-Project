/// @description Insert description here
// You can write your code in this editor



m_curtainTimer++;

if(m_curtainTimer%5 == 0)
{
	m_curtainState++;
}

if(m_curtainTimer >= 120)
	instance_destroy();
