//===========================================================================//
//
// Left 4 Survival - Zombie Escape Map Porting Project
//
// File: zombie_escape.nut
//
// Purpose: Start map specific stuff for ZE Maps
//
// History:    Aug-21-26   Niveal Catto   Created
//			   Aug-24-26   Niveal Catto   Edited comment
//
//===========================================================================//

local map_name = Director.GetMapName();

// Map starts with "ze_" or "zm_"? It's a ZE map.
if (map_name.find("ze_") == 0 || map_name.find("zm_") == 0)
{
	printl("[Left 4 Survival] executing Zombie Escape map Director Options");
	IncludeScript("zombie_escape_options/default");
}