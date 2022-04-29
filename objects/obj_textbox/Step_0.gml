/// @description Insert description here
// You can write your code in this editor

//builds a string reflecting number and location of pieces left by using a list to store remaining piece locations
ds_list_clear(m_dialogueList);

if(!global.piece[0])
	ds_list_add(m_dialogueList, "west");
if(!global.piece[1])
	ds_list_add(m_dialogueList, "south");
if(!global.piece[2])
	ds_list_add(m_dialogueList, "east");

switch(ds_list_size(m_dialogueList))
{
	case 1:
		m_dialogueString = "There is one fragment left in the " + m_dialogueList[|0] + ".";
		break;
	case 2:
		m_dialogueString = "There are two fragments left in the " 
			+ m_dialogueList[|0] + " and " + m_dialogueList[|1] + ".";
		break;
	case 3:
		m_dialogueString = "There are three fragments in the " 
			+ m_dialogueList[|0] + ", " + m_dialogueList[|1] + ", and " + m_dialogueList[|2];
		break;
}

//updates string in the array to the newly constructed string
m_dialogueArray[1][0] = m_dialogueString;
