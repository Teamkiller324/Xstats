/**
 *	Functions.
 */
ConVar TF2_SentryKill;
ConVar TF2_MiniSentryKill;

/* Capture Point */
ConVar TF2_PointCaptured;
ConVar TF2_PointBlocked;

/* Capture-The-Flag */
ConVar TF2_FlagEvent[6];
ConVar TF2_FlagStolen;

/* Player */
ConVar TF2_BuiltObject[6];
ConVar TF2_DestroyObject[6];
ConVar TF2_Ubercharged, TF2_Ubercharged_Spy;
ConVar TF2_Teleported;
ConVar TF2_SandvichStolen;

/* Other */
ConVar TF2_TeleFrag;
ConVar TF2_Stunned;

/* Classes */
ConVar TF2_DeathClass[11];

void PrepareGame_TeamFortress()	{
	/* Buildings */
	TF2_SentryKill		= CreateConVar("xstats_points_sentrykill",		"5",	"Xstats: TF2 - Points given when killing with Sentry gun.", _, true);
	TF2_MiniSentryKill	= CreateConVar("xstats_points_minisentrykill",	"5",	"Xstats: TF2 - Points given when killing with Mini-Sentry gun.", _, true);
	
	/* Capture Point */
	TF2_PointCaptured	= CreateConVar("xstats_points_point_captured",	"5",	"Xstats: TF2 - Points given when capturing a point.", _, true);
	TF2_PointBlocked	= CreateConVar("xstats_points_point_blocked",	"5",	"Xstats: TF2 - Points given when blocking a point from being captured.", _, true);
	
	/* Capture-The-Flag */
	TF2_FlagEvent[1]	= CreateConVar("xstats_points_flag_pickedup",	"5",	"Xstats: TF2 - Points given when picking up the flag.", _, true);
	TF2_FlagEvent[2]	= CreateConVar("xstats_points_flag_captured",	"5",	"Xstats: TF2 - Points given when capturing the flag.", _, true);
	TF2_FlagEvent[3]	= CreateConVar("xstats_points_flag_defended",	"5",	"Xstats: TF2 - Points given when defending the flag.", _, true);
	TF2_FlagEvent[4]	= CreateConVar("xstats_points_flag_dropping",	"5",	"Xstats: TF2 - Points taken when dropping the flag.", _, true);
	TF2_FlagStolen		= CreateConVar("xstats_points_flag_stealing",	"5",	"Xstats: TF2 - Points given when stealing the flag. Paired with picking up.", _, true);
	
	/* Player */
	TF2_BuiltObject[0]	= CreateConVar("xstats_points_place_sentrygun",				"2", "Xstats: TF2 - Points given when placing a Sentrygun.", _, true);
	TF2_BuiltObject[1]	= CreateConVar("xstats_points_place_dispenser",				"2", "Xstats: TF2 - Points given when placing a Dispenser.", _, true);
	TF2_BuiltObject[2]	= CreateConVar("xstats_points_place_teleporter_entrance",	"2", "Xstats: TF2 - Points given when placing a Teleporter Entrance.", _, true);
	TF2_BuiltObject[3]	= CreateConVar("xstats_points_place_teleporter_exit",		"2", "Xstats: TF2 - Points given when placing a Teleporter Exit.", _, true);
	TF2_BuiltObject[4]	= CreateConVar("xstats_points_place_minisentrygun",			"2", "Xstats: TF2 - Points given when placing a Mini-Sentrygun.", _, true);
	TF2_BuiltObject[5]	= CreateConVar("xstats_points_place_sapper",				"2", "Xstats: TF2 - Points given when placing a Sapper.", _, true);
	TF2_DestroyObject[0]= CreateConVar("xstats_points_destroy_sentrygun",			"2", "Xstats: TF2 - Points given when destroying a Sentrygun.", _, true);
	TF2_DestroyObject[1]= CreateConVar("xstats_points_destroy_dispenser",			"2", "Xstats: TF2 - Points given when destroying a Dispenser.", _, true);
	TF2_DestroyObject[2]= CreateConVar("xstats_points_destroy_teleporter_entrance",	"2", "Xstats: TF2 - Points given when destroying a Teleporter Entrance.", _, true);
	TF2_DestroyObject[3]= CreateConVar("xstats_points_destroy_teleporter_exit",		"2", "Xstats: TF2 - Points given when destroying a Teleporter Exit.", _, true);
	TF2_DestroyObject[4]= CreateConVar("xstats_points_destroy_minisentrygun",		"2", "Xstats: TF2 - Points given when destroying a Mini-Sentry Gun.", _, true);
	TF2_DestroyObject[5]= CreateConVar("xstats_points_destroy_sapper",				"2", "Xstats: TF2 - Points given when destroying a Sapper.", _, true);
	TF2_Ubercharged		= CreateConVar("xstats_points_ubercharged",		"5",	"Xstats: TF2 - Points given when ubercharging.", _, true);
	TF2_Ubercharged_Spy	= CreateConVar("xstats_ubercharged_count_spy",	"1",	"Xstats: TF2 - Should an enemy spy be counted as valid?.", _, true, _, true, 1.0);
	TF2_Teleported		= CreateConVar("xstats_points_teleported",		"2",	"Xstats: TF2 - Points given to the builder when teleporter was used.", _, true);
	
	/* Classes */
	TF2_DeathClass[1]	= CreateConVar("xstats_points_death_scout",		"5",	"Xstats: TF2 - Points taken when dying as Scout.", _, true);
	TF2_DeathClass[2]	= CreateConVar("xstats_points_death_sniper",	"5",	"Xstats: TF2 - Points taken when dying as Sniper.", _, true);
	TF2_DeathClass[3]	= CreateConVar("xstats_points_death_soldier",	"5",	"Xstats: TF2 - Points taken when dying as Soldier.", _, true);
	TF2_DeathClass[4]	= CreateConVar("xstats_points_death_demoman",	"5",	"Xstats: TF2 - Points taken when dying as Demoman.", _, true);
	TF2_DeathClass[5]	= CreateConVar("xstats_points_death_medic",		"5",	"Xstats: TF2 - Points taken when dying as Medic.", _, true);
	TF2_DeathClass[6]	= CreateConVar("xstats_points_death_heavy",		"5",	"Xstats: TF2 - Points taken when dying as Heavy.", _, true);
	TF2_DeathClass[7]	= CreateConVar("xstats_points_death_pyro",		"5",	"Xstats: TF2 - Points taken when dying as Pyro.", _, true);
	TF2_DeathClass[8]	= CreateConVar("xstats_points_death_spy",		"5",	"Xstats: TF2 - Points given when dying as Spy.", _, true);
	TF2_DeathClass[9]	= CreateConVar("xstats_points_death_engineer",	"5",	"Xstats: TF2 - Points given when dying as Engineer.", _, true);
	if(IsCurrentGame(Game_TF2C))
		TF2_DeathClass[10] = CreateConVar("xstats_points_death_civilan", "5",	"Xstats: TF2C - Points given when dying as Civilian.", _, true);
	
	/* Other */
	TF2_TeleFrag	= CreateConVar("xstats_points_telefrag",	"5",	"Xstats: TF2 - Points given when telefragging an opponent.", _, true);
	TF2_Stunned		= CreateConVar("xstats_points_stunned",		"2",	"Xstats: TF2 - Points given when stunning an opponent.", _, true);
	
	/* Rounds */
	HookEventEx(EVENT_TEAMPLAY_ROUND_ACTIVE,	TF2Rounds, EventHookMode_Pre);
	HookEventEx(EVENT_ARENA_ROUND_START,		TF2Rounds, EventHookMode_Pre);
	HookEventEx(EVENT_TEAMPLAY_ROUND_WIN,		TF2Rounds, EventHookMode_Pre);
	
	/* Capture Point */
	HookEventEx(EVENT_TEAMPLAY_POINT_CAPTURED,	Teamplay_Point_Captured,	EventHookMode_Pre);
	HookEventEx(EVENT_TEAMPLAY_CAPTURE_BLOCKED,	Teamplay_Capture_Blocked,	EventHookMode_Pre);
	
	/* Capture-The-Flag */
	HookEventEx(EVENT_TEAMPLAY_FLAG_EVENT,		Teamplay_Flag_Event,		EventHookMode_Pre);

	/* Objects | Buildings */
	HookEventEx(EVENT_PLAYER_BUILTOBJECT,		Player_BuiltObject,	EventHookMode_Pre);
	HookEventEx(EVENT_OBJECT_DESTROYED,			Object_Destroyed,	EventHookMode_Pre);
	
	/* Player */
	HookEventEx(EVENT_PLAYER_INVULNED,			Player_Invulned,		EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_TELEPORTED,		Player_Teleported,		EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STEALSANDVICH,		Player_StealSandvich,	EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STUNNED,			Player_Stunned,			EventHookMode_Pre);
	
	/* For some arrays as they use multi-arrays (ArrayExample[MAXPLAYERS][10] for example) */
	ResetAntiAbuseArrays();
}

/* Rounds */
stock void TF2Rounds(Event event, const char[] event_name, bool dontBroadcast)	{StrEqual(event_name, EVENT_TEAMPLAY_ROUND_WIN) ? RoundEnded() : RoundStarted();}

/* Capture Point */
stock void Teamplay_Point_Captured(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_PointCaptured.IntValue < 1)
		return;
	
	char query[256], cpname[64], cappers[MAXPLAYERS];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	event.GetString(EVENT_STR_CAPPERS, cappers, MAXPLAYERS);
	int points = TF2_PointCaptured.IntValue;
	
	for(int i = 0; i < strlen(cappers); i++)	{
		int client = cappers[i];
		
		if(Tklib_IsValidClient(client, true))	{
			GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
			GetClientNameEx(client, Playername[client], sizeof(Playername[]));
			GetClientTeamString(client, Name[client], sizeof(Name[]));
			
			int points_client = GetClientPoints(SteamID[client]);
			CPrintToChat(client, "%s %t", Prefix, "Point Captured", Name[client], points_client, points, cpname);
			
			Format(query, sizeof(query), "update `%s` set PointsCaptured = PointsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
}

stock void Teamplay_Capture_Blocked(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_PointBlocked.IntValue < 1)
		return;
	
	/* Make sure it's a valid capture point map */
	if(!(TF2_GetGameType() == TFGameType_CP || TF2_GetGameType() == TFGameType_Arena))
		return;
	
	char query[256], cpname[64];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	
	int client = event.GetInt(EVENT_STR_BLOCKER);
	int victim = event.GetInt(EVENT_STR_VICTIM);
	int points = TF2_PointBlocked.IntValue;
	
	if(Tklib_IsValidClient(client, true) && Tklib_IsValidClient(victim))	{
		if(IsFakeClient(victim) && !AllowBots.BoolValue)
			return;
		
		GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
		GetClientNameEx(client, Playername[client], sizeof(Playername[]));
		GetClientTeamString(client, Name[client], sizeof(Name[]));
		GetClientTeamString(victim, Name[victim], sizeof(Name[]));
		
		int points_client = GetClientPoints(SteamID[client]);
		CPrintToChat(client, "%s %s (%i) earned %i points for defending point %s from %s",
		Prefix, Name[client], points_client, points, cpname, Name[victim]);
		
		Format(query, sizeof(query), "update `%s` set PointsDefended = PointsDefended+1 where SteamID='%s' and ServerID='%i'",
		playerlist, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
}

/* Capture-The-Flag */
stock void Teamplay_Flag_Event(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_GetGameType() != TFGameType_CTF)
		return;
	
	int client = event.GetInt(EVENT_STR_PLAYER);
	if(!Tklib_IsValidClient(client, true))
		return;
	
	int carrier = event.GetInt(EVENT_STR_CARRIER);
	int eventtype = event.GetInt(EVENT_STR_EVENTTYPE);
	bool home = event.GetBool(EVENT_STR_HOME);
	TFTeam team = TFTeam(event.GetInt(EVENT_STR_TEAM));
	TFFlag flag = TFFlag(eventtype);
	char query[512];
	
	if(Debug.BoolValue)	{
		char teamname[][] = {
			/* 0 */ "Unassigned",
			/* 1 */ "SPEC",
			/* 2 */ "BLU",
			/* 3 */ "RED"
		};
		
		PrintToServer("//===== Teamplay_Flag_Event =====//");
		PrintToServer("player %N (%i)", client, client);
		PrintToServer("carrier %N (%i)", carrier, carrier);
		PrintToServer("eventtype %s", TF2_GetFlagTypeName[eventtype]);
		PrintToServer("home %s", Bool[home]);
		PrintToServer("teamname %s", teamname[team]);
		PrintToServer(" ");
	}
	
	if(TF2_FlagEvent[eventtype].IntValue > 0)	{
		GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
		GetClientTeamString(client, Name[client], sizeof(Name[]));
		int points = TF2_FlagEvent[eventtype].IntValue;
		int points_client = GetClientPoints(SteamID[client]);
		
		/* Flag was picked up */
		if(flag == TFFlag_PickedUp)	{
			points = points+TF2_FlagStolen.IntValue;
			
			switch(home)	{
				/* Flag was stolen */
				case	true:	{
					Session[client].FlagsStolen++;
					Session[client].FlagsPickedUp++;
					Session[client].Points = Session[client].Points+points;
					CPrintToChat(client, "%s %s (%i) earned %i points for stealing the opponent's inteligence.",
					Prefix, Name[client], points_client, points);
					
					Format(query, sizeof(query), "update `%s` Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1, FlagsStolen = FlagsStolen+1 where SteamID='%s' and ServerID='%i'",
					playerlist, points, SteamID[client], ServerID.IntValue); 
					db.Query(DBQuery_Callback, query);
				}
				/* Flag was not stolen (phew, that was close) */
				case	false:	{
					Session[client].FlagsPickedUp++;
					Session[client].Points = Session[client].Points+points;
					CPrintToChat(client, "%s %s (%i) earned %i points for picking up the opponent's intelligence.",
					Prefix, Name[client], points_client, points);
					
					Format(query, sizeof(query), "update `%s` Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1 where SteamID='%s' and ServerID='%i'",
					playerlist, points, SteamID[client], ServerID.IntValue); 
					db.Query(DBQuery_Callback, query);
				}
			}
		}
		
		/* Flag was captured */
		if(flag == TFFlag_Captured)	{
			Session[client].FlagsCaptured++;
			Session[client].Points = Session[client].Points+points;
			CPrintToChat(client, "%s %s (%i) earned %i points for capturing the opponent's intelligence.",
			Prefix, Name[client], points_client, points);
			
			Format(query, sizeof(query), "update `%s` Points = Points+%i, FlagsCaptured = FlagsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		
		/* Flag was defended */
		if(flag == TFFlag_Defended)	{
			Session[client].FlagsDefended++;
			Session[client].Points = Session[client].Points+points;
			CPrintToChat(client, "%s %s (%i) earned %i points for defending the intelligence", Prefix, "Flag Defended",
			Name[client], points_client, points);
			
			Format(query, sizeof(query), "update `%s` Points = Points+%i, FlagsDefended = FlagsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		
		/* Flag was dropped */
		if(flag == TFFlag_Dropped)	{
			Session[client].FlagsDropped++;
			Session[client].Points = Session[client].Points+points;
			CPrintToChat(client, "%s %s (%i) lost %i for dropping the opponents intelligence.",
			Prefix, Name[client], points_client, points);
			
			Format(query, sizeof(query), "update `%s` Points = Points-%i where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
}

/* Objects | Buildings */
float BuiltObject_Timer[5] = {40.0, ...};
bool BuiltObject[MAXPLAYERS][5];
stock void Player_BuiltObject(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	TFBuilding building = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	int type = int(building);
	GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
	
	char query[256];
	switch(building)	{
		case	TFBuilding_Sentrygun:	{
			Format(query, sizeof(query), "update `%s` set SentryGunsBuilt = SentryGunsBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Dispenser:	{
			Format(query, sizeof(query), "update `%s` set DispensersBuilt = DispensersBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_MiniSentry:	{
			Format(query, sizeof(query), "update `%s` set MiniSentryGunsBuilt = MiniSentryGunsBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Entrance:	{
			Format(query, sizeof(query), "update `%s` set TeleporterEntrancesBuilt = TeleporterEntrancesBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Exit:	{
			Format(query, sizeof(query), "update `%s` set TeleporterExitsBuilt = TeleporterExitsBuilt, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Sapper:	{
			Format(query, sizeof(query), "update `%s` set SappersPlaced = SappersPlaced, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
		
	if(!BuiltObject[client][type])	{
		if(TF2_BuiltObject[type].IntValue > 1)	{
			int points = TF2_BuiltObject[type].IntValue;
			int points_client = GetClientPoints(SteamID[client]);
			AddSessionPoints(client, points);
			
			char buildingname[64];
			TF2_GetBuildingName(building, buildingname, sizeof(buildingname));
			
			CPrintToChat(client, "%s %s (%i) earned %i points for deploying a %s",
			Prefix, Name[client], points_client, points, buildingname);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
			
		BuiltObject[client][type] = true;
		DataPack pack = new DataPack();
		pack.WriteCell(client);
		pack.WriteCell(type);
		CreateTimer(BuiltObject_Timer[type], Timer_Player_BuiltObject, pack);
	}
}

stock void Object_Destroyed(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_ATTACKER));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	int points_client = GetClientPoints(SteamID[client]);
	TFBuilding building = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	int type = int(building);
	int points = TF2_DestroyObject[type].IntValue;
	if(points < 1)
		return;
	
	AddSessionPoints(client, points);
	GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
	GetClientTeamString(client, Name[client], sizeof(Name[]));
	
	char query[512], buildingname[64];
	TF2_GetBuildingName(building, buildingname, sizeof(buildingname));
	CPrintToChat(client, "%s %s (%i) earned %i points for destroying a %s belonging to %s",	Prefix, Name[client], points_client, points, buildingname);
	
	switch(building)	{
		case	TFBuilding_Sentrygun:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, SentryGunsDestroyed = SentryGunsDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Dispenser:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, DispensersDestroyed = DispensersDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_MiniSentry:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, MiniSentryGunsDestroyed = MiniSentryGunsDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Entrance:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, TeleporterEntrancesDestroyed = TeleporterEntrancesDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Exit:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, TeleporterExitsDestroyed = TeleporterExitsDestroyed, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Sapper:	{
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, SappersDestroyed = SappersDestroyed where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
}

/* Player */
float Ubercharged_Timer = 30.0;
bool Ubercharged[MAXPLAYERS] = {false, ...};
stock void Player_Invulned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_Ubercharged.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_MEDIC_USERID));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	int points = TF2_Ubercharged.IntValue;
	
	if(Tklib_IsValidClient(victim))	{
		if(IsFakeClient(victim) && !AllowBots.BoolValue)
			return;
		
		if(Ubercharged[client])
			return;
		
		GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
		GetClientTeamString(client, Name[client], sizeof(Name[]));
		GetClientTeamString(victim, Name[victim], sizeof(Name[]));
		
		if(!IsSameTeam(victim, client) && TF2_GetPlayerClass(victim) == TFClass_Spy && !TF2_Ubercharged_Spy.BoolValue)
			return;
		
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		
		CPrintToChat(client, "%s %s (%i) earned %i points for übercharging %s",
		Prefix, Name[client], points_client, Name[victim]);
		
		char query[256];
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, Ubercharged = Ubercharged+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
		
		Ubercharged[client] = true;
		CreateTimer(Ubercharged_Timer, Timer_Player_Invulned, client);
	}
}

float Teleported_Timer = 15.0;
bool Teleported[MAXPLAYERS] = {false, ...};
stock void Player_Teleported(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_Teleported.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_BUILDERID));
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	int points = TF2_Teleported.IntValue;
	if(Tklib_IsValidClient(client, true) && Tklib_IsValidClient(victim) && !Teleported[client])	{
		if(IsFakeClient(victim) && !AllowBots.BoolValue)
			return;
		
		GetClientAuth(client, SteamID[client], sizeof(SteamID[]));
		GetClientAuth(victim, SteamID[victim], sizeof(SteamID[]));
		GetClientTeamString(client, Name[client], sizeof(Name[]));
		GetClientTeamString(victim, Name[victim], sizeof(Name[]));
		
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		
		CPrintToChat(client, "%s %s (%i) earned %i points for %s using your teleporter",
		Prefix, Name[client], points_client, points, Name[victim]);
		
		char query[512];
		Format(query, sizeof(query), "update `%s` set PlayerTeleported = PlayerTeleported+1 where SteamID='%s' and ServerID='%i'",
		playerlist, SteamID[victim], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
		
		Format(query, sizeof(query), "update `%s` set TotalPlayersTeleported = TotalPlayersTeleported+1, Points = Points+%i where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
		
		Teleported[victim] = true;
		CreateTimer(Teleported_Timer, Timer_Player_Teleported, victim);
	}
}

stock void Player_StealSandvich(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_SandvichStolen.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_TARGET));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	GetClientTeamString(client, Name[client], sizeof(Name[]));
	int points = TF2_SandvichStolen.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_OWNER));
	/* Incase the sandvich owner left */
	switch(Tklib_IsValidClient(victim))	{
		case	true:	{
			GetClientTeamString(victim, Name[victim], sizeof(Name[]));
			
			CPrintToChat(client, "%s %s (%i) earned %i points for stealing sandvich belonging to %s",
			Prefix, Name[client], points_client, points, Name[victim]);
		}
		case	false:
			CPrintToChat(client, "%s %s (%i) earned %i points for stealing sandvich.",
			Prefix, Name[client], points_client, points);
	}
	
	char query[256];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, SandvichesStolen = SandvichesStolen+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

stock void Player_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_Stunned.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_STUNNER));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_VICTIM));
	if(!Tklib_IsValidClient(victim))
		return;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return;
	
	AddSessionPoints(client, TF2_Stunned.IntValue);
	GetClientTeamString(client, Name[client], sizeof(Name[]));
	GetClientTeamString(victim, Name[victim], sizeof(Name[]));
	bool big_stun = event.GetBool(EVENT_STR_BIG_STUN);
	int points = TF2_Stunned.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	
	char query[512];
	switch(big_stun)	{
		case	true:	{
			CPrintToChat(client, "%s %s (%i) earned %i points for stunning %s with a {green}Moon Shot{default}.",
			Prefix, Name[client], points_client, client, Name[victim]);

			Format(query, sizeof(query), "update `%s` set Points = Points+%i, MoonShotStunnedPlayers = MoonShotStunnedPlayers+1 where SteamID='%i' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
		}
		case	false:	{
			CPrintToChat(client, "%s %s (%i) earned %i points for stunning %s.",
			Prefix, Name[client], points_client, client, Name[victim]);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, StunnedPlayers = StunnedPlayers+1 where SteamID='%i' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
		}
	}
	

}

/* Bosses */

/* Callbacks & Forwards */
stock Action Timer_Player_BuiltObject(Handle timer, DataPack pack)	{
	pack.Reset();
	int client = pack.ReadCell();
	int type = pack.ReadCell();
	delete pack; /* Prevent handle leak */
	
	BuiltObject[client][type] = false;
}

stock Action Timer_Player_Invulned(Handle timer, int client)	{	Ubercharged[client] = false;	}
stock Action Timer_Player_Teleported(Handle timer, int client)	{	Teleported[client] = false;		}

stock void ResetAntiAbuseArrays()	{
	for(int i = 0; i < MaxClients; i++)
	{
		for(int type = 0; type < 6; type++)
		{
			BuiltObject[i][type] = false;
		}
	}
}

public void TF2_OnWaitingForPlayersStart()	{	WarmupActive = true;	}
public void TF2_OnWaitingForPlayersEnd()	{	WarmupActive = false;	}