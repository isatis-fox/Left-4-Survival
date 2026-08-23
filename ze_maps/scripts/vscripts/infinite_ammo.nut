//===========================================================================//
//
// Left 4 Survival - Zombie Escape Map Porting Project
//
// File: infinite_ammo.nut
//
// Purpose: Infinite reserve ammo recreated in Left 4 Dead 2
//  In zombie escape, all humans have infinite reserve ammo.
//  This vscript implents that.
//
// History:    Aug-14-26   Niveal Catto   Created
//			   Aug-24-26   Niveal Catto   Edited comment
//
//===========================================================================//

weapons <- {
	"weapon_smg": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 50,
		"reserve": 650
	},
	"weapon_smg_mp5": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 50,
		"reserve": 650
	},
	"weapon_smg_silenced": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 50,
		"reserve": 650
	},

	"weapon_pumpshotgun": {
		"reload_type": "Keep current and reload",
		"primary": 8,
		"reserve": 72
	},
	"weapon_shotgun_chrome": {
		"reload_type": "Keep current and reload",
		"primary": 8,
		"reserve": 72
	},
	"weapon_shotgun_spas": {
		"reload_type": "Keep current and reload",
		"primary": 10,
		"reserve": 90
	},
	"weapon_autoshotgun": {
		"reload_type": "Keep current and reload",
		"primary": 10,
		"reserve": 90
	},

	"weapon_rifle": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 50,
		"reserve": 360
	},
	"weapon_rifle_desert": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 60,
		"reserve": 360
	},
	"weapon_rifle_ak47": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 40,
		"reserve": 360
	},
	"weapon_rifle_sg552": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 50,
		"reserve": 360
	},

	"weapon_hunting_rifle": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 15,
		"reserve": 150
	},
	"weapon_sniper_awp": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 20,
		"reserve": 180
	},
	"weapon_sniper_military": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 30,
		"reserve": 180
	},
	"weapon_sniper_scout": {
		"reload_type": "Move all current ammo to reserve",
		"primary": 30,
		"reserve": 180
	},



	"weapon_grenade_launcher": {
		"reload_type": "Single fire, then reload",
		"primary": 1,
		"reserve": 30
	}
}

// function OnGameEvent_item_pickup(params)
// {
// 	printl("eeeeeee");
// }

function OnGameEvent_weapon_fire(params)
{
	local weapon = params.weapon;
	local player = GetPlayerFromUserID(params.userid);

	// printl("Weapon " + weapon);

	if (weapon == "rifle_m60")
	{
		player.GetActiveWeapon().SetClip1(150);
	}

	// if (weapon == "grenade_launcher")
	// {
    // 	local ammoType = NetProps.GetPropInt(weapon, "m_iPrimaryAmmoType");
    // 	if (ammoType >= 0)
	// 	{
	// 		local weaponL = weapons[weapon.GetClassname()];
	// 		local primary = weaponL["primary"];
	// 		local reserve = weaponL["reserve"];
	// 		local newAmmo = reserve + primary;

	// 		NetProps.SetPropIntArray(player, "m_iAmmo", newAmmo, ammoType);
	// 	}
	// }
}

function OnGameEvent_weapon_reload(params)
{
	// userid, manual
	local player = GetPlayerFromUserID(params.userid);
	local weapon_ = player.GetActiveWeapon();
    local ammoType = NetProps.GetPropInt(weapon_, "m_iPrimaryAmmoType");

    if (ammoType >= 0)
    {
		if (weapon_.GetClassname() in weapons)
		{
			local weapon = weapons[weapon_.GetClassname()];

			// printl(weapon_.GetClassname());

			if (weapon["reload_type"] == "Move all current ammo to reserve")
			{
				local primary = weapon["primary"];
				local reserve = weapon["reserve"];
				local newAmmo = reserve + primary;

				// printl("prim: " + primary + "\nrese: " + reserve + "\n\nnewAmmo: " + newAmmo);

				NetProps.SetPropIntArray(player, "m_iAmmo", newAmmo, ammoType);
			} else {
				local current = weapon_.Clip1();
				local prim = weapon["primary"];
				local res = weapon["reserve"];

				// local give = weapon["primary"] - weapon_.Clip1()
				if (weapon_.Clip1() < 1)
				{
					NetProps.SetPropIntArray(player, "m_iAmmo", res + prim, ammoType);
				} else {
					local give = prim - current;
					NetProps.SetPropIntArray(player, "m_iAmmo", res + give, ammoType);
				}
				// print("Current: " + current);
				// print("Max: " + weapon["primary"]);
				// printl(weapon["reload_type"]);
			}
			// if (weapon.GetClassname() == "weapon_smg")
			// {
			// 	// local default =
			// 	NetProps.SetPropIntArray(player, "m_iAmmo", 650, ammoType);
			// }
		} else {
			printl("[Left 4 Escape] AmmoType invaild or bad weapon.. ignoring\nWeapon Class Name: " + weapon_.GetClassname());
		}
    } else {
		printl("[Left 4 Escape] AmmoType invaild or bad weapon.. ignoring");
	}
}
