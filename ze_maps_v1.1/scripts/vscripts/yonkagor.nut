::Cooldown <- false;
::TriggeredTimes <- 0;

local soundEntity = Entities.FindByName(null, "fish");

function PlaySound(how)
{
	if (how == "song")
	{
		local rand = RandomInt(1, 14);

		if (rand < 10)
		{
			EntFire("song_short_0" + rand, "PlaySound");
		} else {
			EntFire("song_short_" + rand, "PlaySound");
		}

		// soundEntity.KeyValueFromString("message", soundNew);
		// EntFire("fish", "PlaySound");
	} else {
		EntFire("fish", "PlaySound");
	}
}

function HideYonKaGor()
{
	local map_name = Director.GetMapName();

	if (map_name.find("winter_helicopter") != null)
	{
		cooldownAlreadyFucked = true;
		EntFire("the_yon_silly", "AddOutput", "origin 771.5 -121.5 88.5");
		EntFire("the_yon_silly", "AddOutput", "origin 771.5 -128.5 88.5", 30.0);
		EntFire("!self", "RunScriptCode", "Cooldown = false;", 31.0);
	}
}

function HideYonKaGorPerm()
{
	local map_name = Director.GetMapName();

	if (map_name.find("winter_helicopter") != null)
	{
		EntFire("the_yon_silly", "AddOutput", "origin 771.5 -121.5 88.5");
		EntFire("the_yon_silly", "AddOutput", "origin 771.5 -128.5 88.5", 30.0);
		EntFire("!self", "RunScriptCode", "Cooldown = false;", 31.0);
	}
}

function YonKaGorLikesFish()
{
	local cooldownAlreadyFucked = false;
	if (Cooldown)
		return;

	ScreenShake(Vector(0, 0, 0), 10.0, 5.0, 2.0, 500.0, 0, true);
	printl(TriggeredTimes);
	Cooldown = true;
	if (TriggeredTimes < 5)
	{
		PlaySound("fish");
	}
	if (TriggeredTimes >= 5 && TriggeredTimes < 20)
	{
		PlaySound("song");
	}
	if (TriggeredTimes > 20 && TriggeredTimes < 25)
	{
		EntFire("server", "Command", "say The cat notices your presence.");
	}
	if (TriggeredTimes >= 25 && TriggeredTimes < 30)
	{
		PlaySound("song");
	}
	if (TriggeredTimes >= 30 && TriggeredTimes < 40)
	{
		EntFire("server", "Command", "say The cat is mildy concerned.");
	}
	if (TriggeredTimes >= 40 && TriggeredTimes < 50)
	{
		PlaySound("song");
	}
	if (TriggeredTimes >= 50 && TriggeredTimes < 60)
	{
		// Spawn tank.
	}
	if (TriggeredTimes >= 60 && TriggeredTimes < 75)
	{
		EntFire("server", "Command", "say The cat regrets giving you attention.");
		PlaySound("song");
	}
	if (TriggeredTimes >= 75 && TriggeredTimes < 80)
	{
		// Spawn tank.
	}
	if (TriggeredTimes >= 80 && TriggeredTimes < 90)
	{
		// Song and screen shake
		PlaySound("song");

		// Parameters: Center vector, Amplitude, Frequency, Duration, Radius, Command, Air shake
		ScreenShake(Vector(0, 0, 0), 10.0, 5.0, 2.0, 500.0, 0, true);
	}
	if (TriggeredTimes >= 90 && TriggeredTimes < 100)
	{
		EntFire("server", "Command", "say Please find something better to do.");
	}
	if (TriggeredTimes >= 100 && TriggeredTimes < 125)
	{
		EntFire("server", "Command", "say STOP TOUCHING THE CAT!");
	}
	// if (TriggeredTimes >= 125 && TriggeredTimes < 150)
	// {
	// 	// Spawn witch
	// }
	// if (TriggeredTimes >= 150 && TriggeredTimes < 200)
	// {
	// 	// Spawn many witch
	// }
	if (TriggeredTimes == 125) //200
	{
		EntFire("server", "Command", "say The cat has contacted management.");
		// Spawn tanks.. pural.
	}
	if (TriggeredTimes == 126) //201
	{
		EntFire("server", "Command", "say Management has reviewed your behavior.. you're fired.");
		// Set the whole fucking room on fire for a minute, disallowing anyone from entering.. even infected!
	}
	if (TriggeredTimes >= 127 && TriggeredTimes < 404) // >= 202 < 404
	{
		EntFire("server", "Command", "say Achievement unlocked: Professional Cat Poker");
		PlaySound("song");
	}

	// silly
	if (TriggeredTimes == 404)
	{
		cooldownAlreadyFucked = true;
		HideYonKaGor();
		EntFire("!self", "RunScriptCode", "Cooldown = false;", 31.0);
	}
	if (TriggeredTimes == 500)
	{
		cooldownAlreadyFucked = true;
		HideYonKaGorPerm();
		EntFire("server", "Command", "say YonKaGor joined SPECATORS");
	}

	TriggeredTimes++;
	if (cooldownAlreadyFucked == false)
	{
		// EntFire("!self", "RunScriptCode", "Cooldown = false;", 1.0);
		EntFire("!self", "RunScriptCode", "Cooldown = false;", 20.0);
	}
}