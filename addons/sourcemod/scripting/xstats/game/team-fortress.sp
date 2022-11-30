/**
 *	Functions.
 */
ConVar TF2_SentryKill
, TF2_MiniSentryKill

/* Capture Point */
, TF2_PointCaptured
, TF2_PointBlocked

/* Capture-The-Flag */
, TF2_FlagEvent[6]
, TF2_FlagStolen

/* Player */
, TF2_BuiltObject[6]
, TF2_DestroyedObject[6]
, TF2_Ubercharged, TF2_Ubercharged_Spy
, TF2_Teleported
, TF2_SandvichStolen
, TF2_Jarated, TF2_MadMilked
, TF2_Extinguished

/* Classes */
, TF2_DeathClass[11]

/* Pass Ball Mode */
, TF2_PassBall[6]

/* Bosses */
, TF2_BossKilled[5]
, TF2_BossStunned[2]

/* Other */
, TF2_TeleFrag
, TF2_Stunned;

void PrepareGame_TeamFortress()	{
	/* Buildings */
	TF2_SentryKill = CreateConVarInt("xstats_points_sentrykill", 5, "Xstats: TF2 - Points given when killing with Sentry gun.", _, true);
	TF2_MiniSentryKill = CreateConVarInt("xstats_points_minisentrykill", 5, "Xstats: TF2 - Points given when killing with Mini-Sentry gun.", _, true);
	
	/* Capture Point */
	TF2_PointCaptured = CreateConVarInt("xstats_points_point_captured", 5, "Xstats: TF2 - Points given when capturing a point.", _, true);
	TF2_PointBlocked = CreateConVarInt("xstats_points_point_blocked", 5, "Xstats: TF2 - Points given when blocking a point from being captured.", _, true);
	
	/* Capture-The-Flag */
	TF2_FlagEvent[1] = CreateConVarInt("xstats_points_flag_pickedup", 5, "Xstats: TF2 - Points given when picking up the flag.", _, true);
	TF2_FlagEvent[2] = CreateConVarInt("xstats_points_flag_captured", 5, "Xstats: TF2 - Points given when capturing the flag.", _, true);
	TF2_FlagEvent[3] = CreateConVarInt("xstats_points_flag_defended", 5, "Xstats: TF2 - Points given when defending the flag.", _, true);
	TF2_FlagEvent[4] = CreateConVarInt("xstats_points_flag_dropping", 5, "Xstats: TF2 - Points taken when dropping the flag.", _, true);
	TF2_FlagStolen = CreateConVarInt("xstats_points_flag_stealing", 5, "Xstats: TF2 - Points given when stealing the flag. Paired with picking up.", _, true);
	
	/* Player */
	TF2_BuiltObject[0] = CreateConVarInt("xstats_points_place_sentrygun", 2, "Xstats: TF2 - Points given when placing a Sentrygun.", _, true);
	TF2_BuiltObject[1] = CreateConVarInt("xstats_points_place_dispenser", 2, "Xstats: TF2 - Points given when placing a Dispenser.", _, true);
	TF2_BuiltObject[2] = CreateConVarInt("xstats_points_place_teleporter_entrance", 2, "Xstats: TF2 - Points given when placing a Teleporter Entrance.", _, true);
	TF2_BuiltObject[3] = CreateConVarInt("xstats_points_place_teleporter_exit", 2, "Xstats: TF2 - Points given when placing a Teleporter Exit.", _, true);
	TF2_BuiltObject[4] = CreateConVarInt("xstats_points_place_minisentrygun", 2, "Xstats: TF2 - Points given when placing a Mini-Sentrygun.", _, true);
	TF2_BuiltObject[5] = CreateConVarInt("xstats_points_place_sapper", 2, "Xstats: TF2 - Points given when placing a Sapper.", _, true);
	TF2_DestroyedObject[0] = CreateConVarInt("xstats_points_destroyed_sentrygun", 2, "Xstats: TF2 - Points given when destroying a Sentrygun.", _, true);
	TF2_DestroyedObject[1] = CreateConVarInt("xstats_points_destroyed_dispenser", 2, "Xstats: TF2 - Points given when destroying a Dispenser.", _, true);
	TF2_DestroyedObject[2] = CreateConVarInt("xstats_points_destroyed_teleporter_entrance", 2, "Xstats: TF2 - Points given when destroying a Teleporter Entrance.", _, true);
	TF2_DestroyedObject[3] = CreateConVarInt("xstats_points_destroyed_teleporter_exit", 2, "Xstats: TF2 - Points given when destroying a Teleporter Exit.", _, true);
	TF2_DestroyedObject[4] = CreateConVarInt("xstats_points_destroyed_minisentrygun", 2, "Xstats: TF2 - Points given when destroying a Mini-Sentry Gun.", _, true);
	TF2_DestroyedObject[5] = CreateConVarInt("xstats_points_destroyed_sapper", 2, "Xstats: TF2 - Points given when destroying a Sapper.", _, true);
	TF2_Ubercharged = CreateConVarInt("xstats_points_ubercharged", 5, "Xstats: TF2 - Points given when ubercharging.", _, true);
	TF2_Ubercharged_Spy = CreateConVarBool("xstats_ubercharged_count_spy", true, "Xstats: TF2 - Should an enemy spy be counted as valid?.");
	TF2_Teleported = CreateConVarInt("xstats_points_teleported", 2, "Xstats: TF2 - Points given to the builder when teleporter was used.", _, true);
	TF2_SandvichStolen = CreateConVarInt("xstats_points_sandvichesstolen", 2, "Xstats: TF2 - Points given when stealing a sandvich.", _, true);
	TF2_Jarated = CreateConVarInt("xstats_points_jarated", 3, "Xstats: TF2 - Points given when coating opponent with a jar.", _, true);
	TF2_MadMilked = CreateConVarInt("xstats_points_madmilked", 2, "Xstats: TF2 - Points given when coating opponent with a milk jar.", _, true);
	TF2_Extinguished = CreateConVarInt("xstats_points_extinguished", 3, "Xstats: TF2 - Points given when extinguishing a teammate.", _, true);
	
	/* Classes */
	TF2_DeathClass[1] = CreateConVarInt("xstats_points_death_scout", 5, "Xstats: TF2 - Points taken when dying as Scout.", _, true);
	TF2_DeathClass[2] = CreateConVarInt("xstats_points_death_sniper", 5, "Xstats: TF2 - Points taken when dying as Sniper.", _, true);
	TF2_DeathClass[3] = CreateConVarInt("xstats_points_death_soldier", 5, "Xstats: TF2 - Points taken when dying as Soldier.", _, true);
	TF2_DeathClass[4] = CreateConVarInt("xstats_points_death_demoman", 5, "Xstats: TF2 - Points taken when dying as Demoman.", _, true);
	TF2_DeathClass[5] = CreateConVarInt("xstats_points_death_medic", 5, "Xstats: TF2 - Points taken when dying as Medic.", _, true);
	TF2_DeathClass[6] = CreateConVarInt("xstats_points_death_heavy", 5, "Xstats: TF2 - Points taken when dying as Heavy.", _, true);
	TF2_DeathClass[7] = CreateConVarInt("xstats_points_death_pyro", 5, "Xstats: TF2 - Points taken when dying as Pyro.", _, true);
	TF2_DeathClass[8] = CreateConVarInt("xstats_points_death_spy", 5, "Xstats: TF2 - Points given when dying as Spy.", _, true);
	TF2_DeathClass[9] = CreateConVarInt("xstats_points_death_engineer", 5, "Xstats: TF2 - Points given when dying as Engineer.", _, true);
	if(IsCurrentGame(Game_TF2C)) TF2_DeathClass[10] = CreateConVarInt("xstats_points_death_civilan", 5, "Xstats: TF2C - Points given when dying as Civilian.", _, true);
	
	/* Pass Ball Mode */
	TF2_PassBall[0] = CreateConVarInt("xstats_points_pass_get", 1, "Xstats: TF2 - Points given when grabbing neutral ball.", _, true);
	TF2_PassBall[1] = CreateConVarInt("xstats_points_pass_score", 2, "Xstats: TF2 - Points given when scoring the ball.", _, true);
	TF2_PassBall[2] = CreateConVarInt("xstats_points_pass_dropball", 1, "Xstats: TF2 - Points given when dropping the ball.", _, true);
	TF2_PassBall[3] = CreateConVarInt("xstats_points_pass_caught", 1, "Xstats: TF2 - Points given when catching the ball.", _, true);
	TF2_PassBall[4] = CreateConVarInt("xstats_points_pass_steal", 2, "Xstats: TF2 - Points given when stealing the ball.", _, true);
	TF2_PassBall[5] = CreateConVarInt("xstats_points_pass_blocked", 1, "Xstats: TF2 - Points given when blocking the ball.", _, true);
	
	/* Bosses */
	TF2_BossKilled[1] = CreateConVarInt("xstats_points_boss_hhh", 5, "Xstats: TF2 - Points given when killing Headless Horseless Headmann.", _, true);
	TF2_BossKilled[2] = CreateConVarInt("xstats_points_boss_monoculus", 5, "Xstats: TF2 - Points given when killing Monoculus.", _, true);
	TF2_BossKilled[3] = CreateConVarInt("xstats_points_boss_merasmus", 5, "Xstats: TF2 - Points given when killing Merasmus.", _, true);
	TF2_BossKilled[4] = CreateConVarInt("xstats_points_boss_skeleton", 5, "Xstats: TF2 - Points given when killing Skeleton King.", _, true);
	TF2_BossStunned[0] = CreateConVarInt("xstats_points_boss_stunned_monoculus", 5, "Xstats: TF2 - Points given when stunning Monoculus.", _, true);
	TF2_BossStunned[1] = CreateConVarInt("xstats_points_boss_stunned_merasmus", 5, "Xstats: TF2 - Points given when stunning Merasmus.", _, true);
	
	/* Other */
	TF2_TeleFrag = CreateConVarInt("xstats_points_telefrag", 5, "Xstats: TF2 - Points given when telefragging an opponent.", _, true);
	TF2_Stunned = CreateConVarInt("xstats_points_stunned", 2, "Xstats: TF2 - Points given when stunning an opponent.", _, true);
	
	/* Capture Point */
	HookEventEx(EVENT_TEAMPLAY_POINT_CAPTURED, Teamplay_Point_Captured, EventHookMode_Pre);
	HookEventEx(EVENT_TEAMPLAY_CAPTURE_BLOCKED, Teamplay_Capture_Blocked, EventHookMode_Pre);
	
	/* Capture-The-Flag */
	HookEventEx(EVENT_TEAMPLAY_FLAG_EVENT, Teamplay_Flag_Event, EventHookMode_Pre);

	/* Objects | Buildings */
	HookEventEx(EVENT_PLAYER_BUILTOBJECT, Player_BuiltObject, EventHookMode_Pre);
	HookEventEx(EVENT_OBJECT_DESTROYED, Object_Destroyed, EventHookMode_Pre);
	
	/* Player */
	HookEventEx(EVENT_PLAYER_INVULNED, Player_Invulned, EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_TELEPORTED, Player_Teleported, EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STEALSANDVICH, Player_StealSandvich, EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STUNNED, Player_Stunned, EventHookMode_Pre);
	
	/* Bosses */
	HookEventEx(EVENT_HALLOWEEN_BOSS_KILLED, Halloween_Boss_Killed, EventHookMode_Pre);
	HookEventEx(EVENT_HALLOWEEN_SKELETON_KILLED, Halloween_Skeleton_Killed, EventHookMode_Pre);
	HookEventEx(EVENT_EYEBALL_BOSS_STUNNED, Eyeball_Boss_Stunned, EventHookMode_Pre);
	HookEventEx(EVENT_MERASMUS_STUNNED, Merasmus_Stunned, EventHookMode_Pre);
	
	/* Pass Ball Mode */
	HookEventEx(EVENT_PASS_GET, PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_SCORE, PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_FREE, PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_PASS_CAUGHT, PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_BALL_STOLEN, PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_BALL_BLOCKED, PassBall, EventHookMode_Pre);
	
	/* User Messages */
	HookUserMessageEx(GetUserMessageId("PlayerJarated"), PlayerJarated);
	HookUserMessageEx(GetUserMessageId("PlayerExtinguished"), PlayerExtinguished);
	HookUserMessageEx(GetUserMessageId("PlayerIgnited"), PlayerIgnited);
	
	/* For some arrays as they use multi-arrays (ArrayExample[MAXPLAYERS][10] for example) */
	//ResetAntiAbuseArrays();
	
	/* Waiting For Players - Just to make all TF2 versions compatible. */
	/* Not working it seems. (Maybe works in TF2C? untested there yet) */
	//HookEventEx(EVENT_TEAMPLAY_WAITING_BEGINS,	WaitingForPlayers, EventHookMode_Pre);
	//HookEventEx(EVENT_TEAMPLAY_WAITING_ENDS,	WaitingForPlayers, EventHookMode_Pre);
}

/* Capture Point */
stock void Teamplay_Point_Captured(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats() || TF2_PointCaptured.IntValue < 1) return;
	
	char[] cappers = new char[MaxPlayers];
	char query[256], cpname[64];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	event.GetString(EVENT_STR_CAPPERS, cappers, MaxPlayers);
	int points = TF2_PointCaptured.IntValue;
	
	char captured_point[64];
	Format(captured_point, sizeof(captured_point), "%t{default}", "Capture Event Type 0");
	
	for(int i = 0; i < strlen(cappers); i++) {
		int client = cappers[i];
		
		if(!(Tklib_IsValidClient(client, true) && !IsValidAbuse(client))) continue;
		Player[client].Session.AddPoints(points);
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		CPrintToChat(client, "%s %t", Global.Prefix, "Capture Point Event", Player[client].Name, Player[client].Points, points, captured_point, cpname);
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PointsCaptured = PointsCaptured+1 where SteamID='%s' and ServerID='%i'",
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
		SQL.Query(DBQuery_Callback, query);
	}
}

stock void Teamplay_Capture_Blocked(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats() || !(TF2_GetGameType() == TFGameType_CP || TF2_GetGameType() == TFGameType_Arena)) return;
	int points = 0
	, client = event.GetInt(EVENT_STR_BLOCKER)
	, victim = event.GetInt(EVENT_STR_VICTIM);
	if(!Tklib_IsValidClient(client, true) || !Tklib_IsValidClient(victim)) return;
	if(IsFakeClient(victim) && !Cvars.AllowBots.IntValue) return;
	if(IsValidAbuse(client)) return;
	if((points = TF2_PointBlocked.IntValue) < 1) return;
	
	/* Make sure it's a valid capture point map */
	char cpname[64], defended_point[64];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	Format(defended_point, sizeof(defended_point), "%t{default}", "Capture Event Type 1");
	
	Player[client].Session.AddPoints(points);
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	CPrintToChat(client, "%s %t", Global.Prefix, Player[client].Name, Player[client].Points, points, defended_point, cpname, Player[victim].Name);
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PointsDefended = PointsDefended+1 where SteamID='%s' and ServerID='%i'",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
}

/* Capture-The-Flag */
stock void Teamplay_Flag_Event(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats() ||  TF2_GetGameType() != TFGameType_CTF || TF2_IsMvMGameMode()) return;
	int points = 0
	, client = event.GetInt(EVENT_STR_PLAYER)
	, carrier = event.GetInt(EVENT_STR_CARRIER)
	, eventtype = event.GetInt(EVENT_STR_EVENTTYPE);
	bool home = event.GetBool(EVENT_STR_HOME);
	TFTeam team = TFTeam(event.GetInt(EVENT_STR_TEAM));
	TFFlag flag = TFFlag(eventtype);
	if(TF2_FlagEvent[eventtype] == null) return;
	if(!Tklib_IsValidClient(client, true) || IsValidAbuse(client) || (points = TF2_FlagEvent[eventtype].IntValue) < 1) return;
	
	char teamname[][] = {
		/* 0 */ "Unassigned",
		/* 1 */ "SPEC",
		/* 2 */ "BLU",
		/* 3 */ "RED"
	};
	
	XStats_DebugText(false, "//===== XStats Debug Log: Teamplay_Flag_Event =====//"
	... "\nplayer %N (%i)"
	... "\ncarrier %N (%i)"
	... "\neventtype %s"
	... "\nhome %s"
	... "\nteamname %s\n"
	, client, client
	, carrier, carrier
	, TF2_FlagTypeName[eventtype]
	, Bool[home]
	, teamname[team]);
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	
	/* Translation */
	char flag_event[][] = {
		"Flag Event Type 0", /* Picked up */
		"Flag Event Type 1", /* Stolen */
		"Flag Event Type 2", /* Capturing */
		"Flag Event Type 3", /* Defending */
		"Flag Event Type 4" /* Dropping */
	}, flag_event_type[64];
	switch(flag) {
		case TFFlag_PickedUp: Format(flag_event_type, sizeof(flag_event_type), "%t{default}", home ? flag_event[1] : flag_event[0]);
		case TFFlag_Captured: Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[2]);
		case TFFlag_Defended: Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[3]);
		case TFFlag_Dropped: Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[4]);
	}
	
	switch(flag) {
		/* Flag was picked up */
		case TFFlag_PickedUp: {
			switch(home) {
				/* Flag was stolen */
				case true: {
					points += TF2_FlagStolen.IntValue;
					Player[client].Session.FlagsStolen++;
					Player[client].Session.FlagsPickedUp++;
					Player[client].Session.AddPoints(points);
					CPrintToChat(client, "%s %t", Global.Prefix, "Flag Event 0", Player[client].Name, Player[client].Points, points, flag_event_type);
					
					SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1, FlagsStolen = FlagsStolen+1 where SteamID='%s' and ServerID = %i",
					Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue); 
					XStats_DebugText(false, "Updating points, flags picked up and stolen flags for %s", Player[client].Playername);
				}
				/* Flag was not stolen (phew, that was close *heavy voice*) */
				case false: {
					Player[client].Session.FlagsPickedUp++;
					Player[client].Session.AddPoints(points);
					CPrintToChat(client, "%s %t", Global.Prefix, "Flag Event 0", Player[client].Name, Player[client].Points, points, flag_event_type);
					
					SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1 where SteamID='%s' and ServerID = %i",
					Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue); 
					XStats_DebugText(false, "Updating points and flags picked up for %s", Player[client].Playername);
				}
			}
		}
		/* Flag was captured */
		case TFFlag_Captured: {
			Player[client].Session.FlagsCaptured++;
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Flag Event 0", Player[client].Name, Player[client].Points, points, flag_event_type);
			
			SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, FlagsCaptured = FlagsCaptured+1 where SteamID='%s' and ServerID = %i",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			XStats_DebugText(false, "Updating points for %s due to capturing flag", Player[client].Playername);
		}
		/* Flag was defended */
		case TFFlag_Defended: {
			Player[client].Session.FlagsDefended++;
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Flag Event 0", Player[client].Name, Player[client].Points, points, flag_event_type);
			
			SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, FlagsDefended = FlagsCaptured+1 where SteamID='%s' and ServerID = %i",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			XStats_DebugText(false, "Updating points for %s due to defending flag", Player[client].Playername);
		}
		/* Flag was dropped */
		case TFFlag_Dropped: {
			Player[client].Session.FlagsDropped++;
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Flag Event 1", Player[client].Name, Player[client].Points, points, flag_event_type);
			
			SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points-%i where SteamID='%s' and ServerID = %i",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			XStats_DebugText(false, "Updating points for %s due to dropping flag", Player[client].Playername);
		}
	}
	
	PrepareTF2FlagEventForward(client, carrier, flag, home);
}

/* Objects | Buildings */
//float BuiltObject_Timer[6] = {240.0, ...};
//bool BuiltObject[MAXPLAYERS+1][6];
stock void Player_BuiltObject(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats()) return;
	int points = 0
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	TFBuilding type = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	if(!Tklib_IsValidClient(client, true) || IsValidAbuse(client)) return;
	
	char building_name[][] = {
		"Object Type 0", /* Sentrygun */
		"Object Type 1", /* Dispenser */
		"Object Type 2", /* Teleporter Entrance */
		"Object Type 3", /* Teleporter Exit */
		"Object Type 4", /* Mini-Sentrygun */
		"Object Type 5", /* Sapper */
	}, event_type[][] = {
		"Object Event Type 0", /* Building */
		"Object Event Type 1", /* Placing */
		"Object Event Type 2", /* Destroying */
	}, object_name[64], type_name[64];
	Format(object_name, sizeof(object_name), "%t{default}", building_name[type]);
	Format(type_name, sizeof(type_name), "%t{default}", type == TFBuilding_Sapper ? event_type[1] : event_type[0]);
	
	char query[512];
	int len = 0;
	len += Format(query[len], sizeof(query)-len, "update `%s` set ", Global.playerlist);
	
	switch(type) {
		case TFBuilding_Sentrygun: {
			Player[client].Session.SentryGunsBuilt++;
			Player[client].Session.BuildingsBuilt++;
			len += Format(query[len], sizeof(query)-len, "SentryGunsBuilt = SentryGunsBuilt+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsBuilt");
		}
		case TFBuilding_Dispenser: {
			Player[client].Session.DispensersBuilt++;
			Player[client].Session.BuildingsBuilt++;
			len += Format(query[len], sizeof(query)-len, "DispensersBuilt = DispensersBuilt+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsBuilt");
		}
		case TFBuilding_MiniSentry: {
			Player[client].Session.MiniSentryGunsBuilt++;
			Player[client].Session.BuildingsBuilt++;
			len += Format(query[len], sizeof(query)-len, "MiniSentryGunsBuilt = MiniSentryGunsBuilt+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsBuilt");
		}
		case TFBuilding_Teleporter_Entrance: {
			Player[client].Session.TeleporterEntrancesBuilt++;
			Player[client].Session.TeleportersBuilt++;
			Player[client].Session.BuildingsBuilt++;
			len += Format(query[len], sizeof(query)-len, "TeleporterEntrancesBuilt = TeleporterEntrancesBuilt+1");
			len += QueryFormat(query[len], sizeof(query)-len, "TeleportersBuilt");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsBuilt");
		}
		case TFBuilding_Teleporter_Exit: {
			Player[client].Session.TeleporterExitsBuilt++;
			Player[client].Session.TeleportersBuilt++;
			Player[client].Session.BuildingsBuilt++;
			len += Format(query[len], sizeof(query)-len, "TeleporterExitsBuilt = TeleporterExitsBuilt+1");
			len += QueryFormat(query[len], sizeof(query)-len, "TeleportersBuilt");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsBuilt");
		}
		case TFBuilding_Sapper: {
			Player[client].Session.SappersPlaced++;
			len += Format(query[len], sizeof(query)-len, "SappersPlaced = SappersPlaced+1");
		}
	}
	
	/* Ensure the player cannot abuse the points */
	if(!HasStored(client, "builtobject_%i", type)) {
		if((points = TF2_BuiltObject[type].IntValue) > 0) {
			Player[client].Points = GetClientPoints(Player[client].SteamID);
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Object Event", Player[client].Name, Player[client].Points, points, type_name, object_name);
			
			len += QueryFormat(query[len], sizeof(query)-len, "Points", _, points);
		}
			
		//BuiltObject[client][type] = true;
		SetStored(client, "builtobject_%i", true, type);
		
		DataPack pack;
		CreateDataTimer(240.0, Timer_Player_BuiltObject, pack);
		pack.WriteCell(client);
		pack.WriteCell(type);
		pack.Reset();
	}
	
	len += QueryFormatFinal(query[len], sizeof(query)-len, Player[client].SteamID);
	SQL.Query(DBQuery_Callback, query);
}

//float DestroyedObject_Timer[6] = {40.0, ...};
//bool DestroyedObject[MAXCLIENTS][6];
stock void Object_Destroyed(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats()) return;
	int points = 0
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_ATTACKER));
	TFBuilding type = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	if(!Tklib_IsValidClient(client, true) || IsValidAbuse(client)) return;
	
	char building_name[][] = {
		"Object Type 0", /* Sentrygun */
		"Object Type 1", /* Dispenser */
		"Object Type 2", /* Teleporter Entrance */
		"Object Type 3", /* Teleporter Exit */
		"Object Type 4", /* Mini-Sentrygun */
		"Object Type 5", /* Sapper */
	}, event_type[][] = {
		"Object Event Type 0", /* Building */
		"Object Event Type 1", /* Placing */
		"Object Event Type 2", /* Destroying */
	}, object_name[64], type_name[64];
	Format(object_name, sizeof(object_name), "%t{default}", building_name[type]);
	Format(type_name, sizeof(type_name), "%t{default}", type == TFBuilding_Sapper ? event_type[1] : event_type[2]);
	
	char query[512];
	int len = 0;
	len += Format(query[len], sizeof(query)-len, "update `%s` set ", Global.playerlist);
	
	switch(type) {
		case TFBuilding_Sentrygun: {
			Player[client].Session.SentryGunsDestroyed++;
			Player[client].Session.BuildingsDestroyed++;
			len += Format(query[len], sizeof(query)-len, "SentryGunsDestroyed = SentryGunsDestroyed+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsDestroyed");
		}
		case TFBuilding_Dispenser: {
			Player[client].Session.DispensersDestroyed++;
			Player[client].Session.BuildingsDestroyed++;
			len += Format(query[len], sizeof(query)-len, "DispensersDestroyed = DispensersDestroyed+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsDestroyed");
		}
		case TFBuilding_MiniSentry: {
			Player[client].Session.MiniSentryGunsDestroyed++;
			Player[client].Session.BuildingsDestroyed++;
			len += Format(query[len], sizeof(query)-len, "MiniSentryGunsDestroyed = MiniSentryGunsDestroyed+1");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsDestroyed");
		}
		case TFBuilding_Teleporter_Entrance: {
			Player[client].Session.TeleporterEntrancesDestroyed++;
			Player[client].Session.TeleportersDestroyed++;
			Player[client].Session.BuildingsDestroyed++;
			len += Format(query[len], sizeof(query)-len, "TeleporterEntrancesDestroyed = TeleporterEntrancesDestroyed+1");
			len += QueryFormat(query[len], sizeof(query)-len, "TeleportersDestroyed");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsDestroyed");
		}
		case TFBuilding_Teleporter_Exit: {
			Player[client].Session.TeleporterExitsDestroyed++;
			Player[client].Session.TeleportersDestroyed++;
			Player[client].Session.BuildingsDestroyed++;
			len += Format(query[len], sizeof(query)-len, "TeleporterExitsDestroyed = TeleporterExitsDestroyed+1");
			len += QueryFormat(query[len], sizeof(query)-len, "TeleportersDestroyed");
			len += QueryFormat(query[len], sizeof(query)-len, "BuildingsDestroyed");
		}
		case TFBuilding_Sapper: {
			Player[client].Session.SappersDestroyed++;
			len += Format(query[len], sizeof(query)-len, "SappersDestroyed = SappersDestroyed+1");
		}
	}
	
	/* Ensure the player cannot abuse the points */
	if(!HasStored(client, "destroyedobject_%i", type)) {
		if((points = TF2_DestroyedObject[type].IntValue) > 0) {
			Player[client].Points = GetClientPoints(Player[client].SteamID);
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Object Event", Player[client].Name, Player[client].Points, points, type_name, object_name);
			
			len += QueryFormat(query[len], sizeof(query)-len, "Points", _, points);
		}
		
		//DestroyedObject[client][type] = true;
		SetStored(client, "destroyedobject_%i", true, type);
		DataPack pack;
		CreateDataTimer(40.0, Timer_Player_DestroyedObject, pack);
		pack.WriteCell(client);
		pack.WriteCell(type);
		pack.Reset();
	}
	
	len += QueryFormatFinal(query[len], sizeof(query)-len, Player[client].SteamID);
	SQL.Query(DBQuery_Callback, query);
}

/* Player */
//float Ubercharged_Timer = 30.0;
//bool Ubercharged[MAXPLAYERS+1] = {false, ...};
stock void Player_Invulned(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats()) return;
	int points
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_MEDIC_USERID))
	, victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(client, true) || !Tklib_IsValidClient(victim) || HasStored(client, "ubercharged")) return;
	if(IsValidAbuse(client) || (points = TF2_Ubercharged.IntValue) < 1 || IsFakeClient(victim) && !Cvars.ServerID.IntValue) return;
	if(!IsSameTeam(victim, client) && TF2_GetPlayerClass(victim) == TFClass_Spy && !TF2_Ubercharged_Spy.BoolValue) return;
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	CPrintToChat(client, "%s %t", Global.Prefix, "Player Ubercharged", Player[client].Name, Player[client].Points, points, Player[victim].Name);
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, Ubercharged = Ubercharged+1 where SteamID = '%s' and ServerID = %i",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	
	//Ubercharged[client] = true;
	SetStored(client, "ubercharged", true);
	CreateTimer(30.0, Timer_Player_Invulned, client);
}

//float Teleported_Timer = 15.0;
//bool Teleported[MAXPLAYERS+1] = {false, ...};
stock void Player_Teleported(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats()) return;
	int points
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_BUILDERID))
	, victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(client, true) || !Tklib_IsValidClient(victim) || HasStored(victim, "teleported")) return;
	if(IsSamePlayers(client, victim)) return;
	if(IsValidAbuse(client) || IsFakeClient(victim) && !Cvars.ServerID.IntValue || (points = TF2_Teleported.IntValue) < 1) return;
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	CPrintToChat(client, "%s %t", Global.Prefix, "Player Used Teleporter", Player[client].Name, Player[client].Points, points, Player[victim].Name);
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set PlayerTeleported = PlayerTeleported+1 where SteamID='%s' and ServerID = %i",
	Global.playerlist, Player[victim].SteamID, Cvars.ServerID.IntValue);
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set TotalPlayersTeleported = TotalPlayersTeleported+1, Points = Points+%i where SteamID='%s' and ServerID = %i",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	
	//Teleported[victim] = true;
	SetStored(client, "teleported", true);
	CreateTimer(15.0, Timer_Player_Teleported, victim);
}

stock void Player_StealSandvich(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats()) return;
	int points
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_TARGET))
	, victim = GetClientOfUserId(event.GetInt(EVENT_STR_OWNER));
	if(!Tklib_IsValidClient(client, true)) return;
	if(IsValidAbuse(client) || (points = TF2_SandvichStolen.IntValue) < 1) return;
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	
	/* Incase the sandvich owner left */
	switch(Tklib_IsValidClient(victim))	{
		case true: CPrintToChat(client, "%s %t", Global.Prefix, "Player Steal Sandvich Scenario 1", Player[client].Name, Player[client].Points, points, Player[victim].Name);
		case false: CPrintToChat(client, "%s %t", Global.Prefix, "Player Steal Sandvich Scenario 2", Player[client].Name, Player[client].Points, points);
	}
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, SandvichesStolen = SandvichesStolen+1 where SteamID='%s' and ServerID = %i",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
}

stock void Player_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats()) return;
	int points
	, client = GetClientOfUserId(event.GetInt(EVENT_STR_STUNNER))
	, victim = GetClientOfUserId(event.GetInt(EVENT_STR_VICTIM));
	bool big_stun = event.GetBool(EVENT_STR_BIG_STUN);
	if(!Tklib_IsValidClient(client, true) || !Tklib_IsValidClient(victim, true)) return;
	if(IsValidAbuse(client) || !Cvars.AllowBots.BoolValue && IsFakeClient(victim) || (points = TF2_Stunned.IntValue) < 1) return;
	
	Player[client].Session.AddPoints(points);
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	
	switch(big_stun) {
		case true: {
			CPrintToChat(client, "%s %t", Global.Prefix, "Player Stun Scenario 1", Player[client].Name, Player[client].Points, client, Player[victim].Name);
			SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, MoonShotStunnedPlayers = MoonShotStunnedPlayers+1 where SteamID='%i' and ServerID = %i",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
		}
		case false: {
			CPrintToChat(client, "%s %t", Global.Prefix, "Player Stun Scenario 2", Player[client].Name, Player[client].Points, client, Player[victim].Name);
			SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, StunnedPlayers = StunnedPlayers+1 where SteamID='%i' and ServerID = %i",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
		}
	}
}

/* Pass Ball Mode */
stock void PassBall(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats() || TF2_GetGameType() != TFGameType_PassBall) return;
	
	int client, points = 0;
	
	if(StrEqual(event_name, EVENT_PASS_GET) && (client = event.GetInt(EVENT_STR_OWNER)) > 0 && (points = TF2_PassBall[0].IntValue) > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Grab Neutral Ball", Player[client].Name, Player[client].Points, points);
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PassBallsGotten = PassBallsGotten+1 where SteamID='%s' and ServerID = %i", 
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
	
	if(StrEqual(event_name, EVENT_PASS_SCORE) && (client = event.GetInt(EVENT_STR_SCORER)) > 0 && (points = TF2_PassBall[1].IntValue) > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		CPrintToChat(client, "%s %t", Global.Prefix, "PasBall Score Ball", Player[client].Name, Player[client].Points, points);
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PassBallsScored = PassBallsScored+1 where SteamID='%s' and ServerID = %i", 
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
	
	if(StrEqual(event_name, EVENT_PASS_FREE) && (client = event.GetInt(EVENT_STR_OWNER)) > 0 && (points = TF2_PassBall[2].IntValue) > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		CPrintToChat(client, "%t", Global.Prefix, "PassBall Drop Ball", Player[client].Name, Player[client].Points, points);
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points-%i, PassBallsDropped = PassBallsDropped+1 where SteamID='%s' and ServerID = %i",
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
	
	if(StrEqual(event_name, EVENT_PASS_PASS_CAUGHT) && (client = event.GetInt(EVENT_STR_CATCHER)) > 0 && (points = TF2_PassBall[3].IntValue) > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		int passer = GetClientOfUserId(event.GetInt(EVENT_STR_PASSER));
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		
		switch(Tklib_IsValidClient(passer, !(IsFakeClient(passer) && !Cvars.AllowBots.BoolValue)))	{
			case true: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Scenario 1", Player[client].Name, Player[client].Points, points, Player[passer].Name);
			case false: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Scenario 2", Player[client].Name, Player[client].Points, points);
		}
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PassBallsCatched = PassBallsCatched+1 where SteamID='%s' and ServerID = %i",
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
	
	if(StrEqual(event_name, EVENT_PASS_BALL_STOLEN) && (client = event.GetInt(EVENT_STR_ATTACKER)) > 0 && (points = TF2_PassBall[4].IntValue) > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		int victim = GetClientOfUserId(event.GetInt(EVENT_STR_VICTIM));
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		
		switch(Tklib_IsValidClient(victim, !(IsFakeClient(victim) && !Cvars.AllowBots.BoolValue)))	{
			case true: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Steal Ball Scenario 1", Player[client].Name, Player[client].Points, points, Player[victim].Name);
			case false: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Steal Ball Scenario 2", Player[client].Name, Player[client].Points, points);
		}
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PassBallsStolen = PassBallsStolen+1 where SteamID='%s' and ServerID = %i",
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
	
	if(StrEqual(event_name, EVENT_PASS_BALL_BLOCKED) && (client = event.GetInt(EVENT_STR_BLOCKER)) > 0 && TF2_PassBall[5].IntValue > 0)	{
		if(!Tklib_IsValidClient(client, true)) return;
		if(IsValidAbuse(client)) return;
		
		int victim = GetClientOfUserId(event.GetInt(EVENT_STR_OWNER));
		Player[client].Points = GetClientPoints(Player[client].SteamID);
		Player[client].Session.AddPoints(points);
		
		switch(Tklib_IsValidClient(victim, !(IsFakeClient(victim) && !Cvars.AllowBots.BoolValue)))	{
			case true: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Block Ball Scenario 1", Player[client].Name, Player[client].Points, points, Player[victim].Name);
			case false: CPrintToChat(client, "%s %t", Global.Prefix, "PassBall Block Ball Scenario 2", Player[client].Name, Player[client].Points, points);
		}
		
		SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, PassBallsBlocked = PassBallBlocked+1 where SteamID='%s' and ServerID = %i",
		Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	}
}

/* Bosses */
stock void Halloween_Boss_Killed(Event event, const char[] event_name, bool dontBroadcast)	{
	/*	Halloween bosses.
		1 - Horseless Headless Horsemann.
		2 - Monoculus.
		3 - Merasmus.
	*/
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_KILLER))
	, boss = event.GetInt(EVENT_STR_BOSS)
	, points = TF2_BossKilled[boss].IntValue;
	if(!Tklib_IsValidClient(client, true))return;
	if(!IsValidAbuse(client)) return;
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	
	char halloween_type[][] = {
		"Halloween Boss Type 1", /* Horseless Headless Horsemann. */
		"Halloween Boss Type 2", /* Monoculus */
		"Halloween Boss Type 3", /* Merasmus */
	}, boss_name_debug[][] = {
		"Unused / Invalid Boss (id 0)",
		"Horseless Headless Horsemann.",
		"Monoculus",
		"Merasmus",
	}, boss_name[64];
	
	XStats_DebugText(false, "//===== Halloween_Boss_Killed =====//"
	... "\nKiller: %N"
	... "\nBoss ID: %i"
	... "\nBoss: %s"
	... "\nPoints: %i\n"
	, client
	, boss
	, boss_name_debug[boss]
	, points);
	
	Format(boss_name, sizeof(boss_name), "%s{default}", halloween_type[boss]);
	
	if(points > 0) {
		Player[client].Session.AddPoints(points);
		CPrintToChat(client, "%s %t", Global.Prefix, "Halloween Kill Event", Player[client].Name, Player[client].Points, points, boss_name);
		
		switch(boss) {
			case TFBoss_Killed_HHH: {
				Player[client].Session.KilledHHH++;
				
				SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, TotalKilledHHH = TotalKilledHHH+1 where SteamID='%s' and ServerID='%i'",
				Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			}
			case TFBoss_Killed_Monoculus: {
				Player[client].Session.KilledMonoculus++;
				
				SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, TotalKilledMonoculus = TotalKilledMonoculus+1 where SteamID='%s' and ServerID='%i'",
				Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			}
			case TFBoss_Killed_Merasmus: {
				Player[client].Session.KilledMerasmus++;
				
				SQL.QueryEx(DBQuery_Callback, "update `%s` set Points = Points+%i, TotalKilledMerasmus = TotalKilledMerasmus+1 where SteamID='%s' and ServerID='%i'",
				Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			}
		}
	}
}

/* Skeleton King */
stock void Halloween_Skeleton_Killed(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats()) return;
	int points, client = GetClientOfUserId(event.GetInt(EVENT_STR_PLAYER));
	if(!Tklib_IsValidClient(client, true)) return;
	if(IsValidAbuse(client) || (points = TF2_BossKilled[4].IntValue) < 1) return;
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	Player[client].Session.KilledSkeletonKing++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 4");
	CPrintToChat(client, "%s %t", Global.Prefix, "Halloween Kill Event", Player[client].Name, Player[client].Points, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalKilledSkeletonKing = TotalKilledSkeletonKing+1 where SteamID='%s' and ServerID = %i",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	SQL.Query(DBQuery_Callback, query);
}

stock void Eyeball_Boss_Stunned(Event event, const char[] event_name, bool dontBroadcast) {
	if(!IsValidStats()) return;
	int points, client = event.GetInt(EVENT_STR_PLAYER_ENTINDEX);
	if(!Tklib_IsValidClient(client, true)) return;
	if(IsValidAbuse(client) || (points = TF2_BossStunned[0].IntValue) < 1) return;
	
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	Player[client].Session.StunnedMonoculus++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 2");
	CPrintToChat(client, "%s %t", Global.Prefix, "Halloween Stun Event", Player[client].Name, Player[client].Points, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalMonoculusStunned = TotalMonoculusStunned+1 where SteamID='%s' and ServerID='%i'",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	SQL.Query(DBQuery_Callback, query);
}

stock void Merasmus_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_BossStunned[1].IntValue < 1) return;
	int client = event.GetInt(EVENT_STR_PLAYER_ENTINDEX);
	if(!Tklib_IsValidClient(client, true)) return;
	if(IsValidAbuse(client)) return;
	
	int points = TF2_BossStunned[1].IntValue;
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	Player[client].Session.StunnedMonoculus++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 3");
	CPrintToChat(client, "%s %t", Global.Prefix, "Halloween Stun Event", Player[client].Name, Player[client].Points, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalMerasmusStunned = TotalMerasmusStunned+1 where SteamID='%s' and ServerID='%i'",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
	SQL.Query(DBQuery_Callback, query);
}

/* User Messages */
//float Jarated_Timer = 25.0;
//float MadMilked_Timer = 25.0;
//bool Jarated[MAXCLIENTS] = {false, ...};
//bool MadMilked[MAXCLIENTS] = {false, ...};
Action PlayerJarated(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{	
	/* Manually fire a broken event */
	Event event = CreateEvent("player_jarated", true);
	int client = bf.ReadByte();
	int victim = bf.ReadByte();
	int defindex = Ent(TF2_GetPlayerWeaponSlot(client, TFSlot_Secondary)).DefinitionIndex;
	event.SetInt("thrower_entindex", client);
	event.SetInt("victim_entindex", victim);
	event.SetInt("itemdefindex", defindex);
	event.Fire();
	
	if(!IsValidStats() || TF2_Jarated.IntValue < 1) return Plugin_Handled; /* Should do no harm to the usermessage event */
	if(!Tklib_IsValidClient(client, true)) return Plugin_Handled;
	if(IsValidAbuse(client)) return Plugin_Handled;
	if(!Tklib_IsValidClient(victim)) return Plugin_Handled;
	if(IsFakeClient(victim) && !Cvars.AllowBots.BoolValue) return Plugin_Handled;
	
	DataPack pack = new DataPack();
	pack.WriteCell(client);
	pack.WriteCell(victim);
	pack.WriteCell(defindex);
	pack.Reset();
	RequestFrame(FramePlayerJarated, pack);
	return Plugin_Continue;
}

void FramePlayerJarated(DataPack pack)	{
	int client = pack.ReadCell();
	int victim = pack.ReadCell();
	int defindex = pack.ReadCell();
	delete pack;
	
	int points = 0;
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.Coated++;
		
	char query[512];
	switch(defindex) {
		/* Madmilk & Mutated Milk */
		case 222, 1121:	{
			//if(MadMilked[client]) return;
			if(HasStored(client, "madmilked")) return;
			
			points = TF2_MadMilked.IntValue;
			Player[client].Session.MadMilked++;
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Player Coated Milk", Player[client].Name, Player[client].Points, points, Player[victim].Name);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, MadMilked = MadMilked+1 where SteamID='%s' and ServerID='%i'",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			SQL.Query(DBQuery_Callback, query);
			
			//MadMilked[client] = true;
			SetStored(client, "madmilked", true);
			CreateTimer(0.50, Timer_PlayerMadMilked, client);
		}
		/* Jarate & The Self-Aware Beauty Mark */
		case 58, 1105: {
			//if(Jarated[client]) return;
			if(HasStored(client, "jarated")) return;
			
			points = TF2_Jarated.IntValue;
			Player[client].Session.Jarated++;
			Player[client].Session.AddPoints(points);
			CPrintToChat(client, "%s %t", Global.Prefix, "Player Coated Jar", Player[client].Name, Player[client].Points, points, Player[victim].Name);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, Jarated = Jarated+1 where SteamID='%s' and ServerID='%i'",
			Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
			SQL.Query(DBQuery_Callback, query);
			
			//Jarated[client] = true;
			SetStored(client, "jarated", true);
			CreateTimer(0.50, Timer_PlayerJarated, client);
		}
		/* Incase the player was coated with piss via Sydney Sleeper. */
		default: {
			if(Ent(TF2_GetPlayerWeaponSlot(client, TFSlot_Primary)).DefinitionIndex == 230 && !HasStored(client, "jarated")) {
				points = TF2_Jarated.IntValue;
				Player[client].Session.Jarated++;
				Player[client].Session.AddPoints(points);
				CPrintToChat(client, "%s %t", Global.Prefix, "Player Coated Jar", Player[client].Name, Player[client].Points, points, Player[victim].Name);
				
				Format(query, sizeof(query), "update `%s` set Points = Points+%i, Jarated = Jarated+1 where SteamID='%s' and ServerID='%i'",
				Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
				SQL.Query(DBQuery_Callback, query);
				
				//Jarated[client] = true;
				SetStored(client, "jarated", true);
				CreateTimer(0.50, Timer_PlayerJarated, client);
			}
		}
	}
	
	XStats_DebugText(false, "//===== PlayerJarated =====\\"
	... "\nClient: %s (index %i)"
	... "\nVictim: %s (index %i)"
	... "\nDefindex: %i\n"
	, Player[client].Playername, client
	, Player[victim].Playername, victim
	, defindex);
}

//float Extinguished_Timer = 10.0;
//bool Extinguished[MAXCLIENTS] = {false, ...};
Action PlayerExtinguished(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{	
	/* Because event "player_extinguished" is broken, we can manually force the event to be fired. */
	Event event = CreateEvent("player_extinguished", true);
	int client = bf.ReadByte();
	int victim = bf.ReadByte();
	int defindex = bf.ReadByte();
	event.SetInt("healer", client);
	event.SetInt("itemdefindex", defindex);
	event.Fire();
	
	if(!IsValidStats() || TF2_Extinguished.IntValue < 1) return Plugin_Handled;
	if(!Tklib_IsValidClient(client, true)) return Plugin_Handled;
	if(IsValidAbuse(client)) return Plugin_Handled;
	if(!Tklib_IsValidClient(victim)) return Plugin_Handled;
	
	XStats_DebugText(false, "//===== PlayerExtinguished =====\\"
	... "\nClient: %s (index %i)"
	... "\nVictim: %s (index %i)\n"
	, Player[client].Playername, client
	, Player[victim].Playername, victim);
	
	if(HasStored(client, "extinguished")) return Plugin_Handled;
	
	DataPack pack = new DataPack();
	pack.WriteCell(client);
	pack.WriteCell(victim);
	pack.Reset();
	RequestFrame(FramePlayerExtinguished, pack);
	return Plugin_Continue;
}

void FramePlayerExtinguished(DataPack pack)	{
	int client = pack.ReadCell();
	int victim = pack.ReadCell();
	delete pack;
	
	int points = TF2_Extinguished.IntValue;
	Player[client].Points = GetClientPoints(Player[client].SteamID);
	Player[client].Session.AddPoints(points);
	
	CPrintToChat(client, "%s %t", Global.Prefix, "Player Extinguished", Player[client].Name, Player[client].Points, points, Player[victim].Name);
	
	char query[512];			
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, Extinguished = Extinguished+1 where SteamID='%s' and ServerID='%i'",
	Global.playerlist, points, Player[client].SteamID, Cvars.ServerID.IntValue);
		
	//Extinguished[client] = true;
	SetStored(client, "extinguished", true);
	CreateTimer(10.0, Timer_PlayerExtinguished, client);
}

Action PlayerIgnited(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{	
	Event event = CreateEvent("player_ignited", true);
	int client = bf.ReadByte();
	int victim = bf.ReadByte();
	event.SetInt("pyro_entindex", client);
	event.SetInt("victim_entindex", victim);
	event.Fire();
	
	if(!IsValidStats()) return Plugin_Handled;
	if(!Tklib_IsValidClient(client, true)) return Plugin_Handled;
	if(IsValidAbuse(client)) return Plugin_Handled;
	if(!Tklib_IsValidClient(victim)) return Plugin_Handled;
	
	Player[client].Session.Ignited++;
	XStats_DebugText(false, "//===== XStats Debug Log: PlayerIgnited =====//"
	... "\nClient: %s (index %i)"
	... "\nVictim: %s (index %i)\n"
	, Player[client].Playername, client
	, Player[client].Playername, victim);
	return Plugin_Continue;
}

/* Callbacks & Forwards */
stock Action Timer_Player_BuiltObject(Handle timer, DataPack pack) {
	int client = pack.ReadCell();
	int type = pack.ReadCell();
	//BuiltObject[client][type] = false;
	SetStored(client, "builtobject_%i", false, type);
}
stock Action Timer_Player_DestroyedObject(Handle timer, DataPack pack) {
	int client = pack.ReadCell();
	int type = pack.ReadCell();
	//DestroyedObject[client][type] = false;
	SetStored(client, "destroyedobject_%i", false, type);
}

stock Action Timer_Player_Invulned(Handle timer, int client) { SetStored(client, "ubercharged", false); }
stock Action Timer_Player_Teleported(Handle timer, int client) { SetStored(client, "teleported", false); }
stock Action Timer_PlayerJarated(Handle timer, int client) { SetStored(client, "jarated", false); }
stock Action Timer_PlayerMadMilked(Handle timer, int client) { SetStored(client, "madmilked", false); }
stock Action Timer_PlayerExtinguished(Handle timer, int client) { SetStored(client, "extinguished", false); }

stock void ResetAntiAbuseArrays() {
	if(!Cvars.PluginActive.BoolValue) return;
	TargetLoop(client) for(int type = 0; type < 6; type++) BuiltObject[client][type] = false;
}

/* Waiting For Players */

/*
Seems to not work in TF2. (Maybe TF2C?)
stock void WaitingForPlayers(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!Cvars.PluginActive.BoolValue)
		return;
	
	WarmupActive = StrEqual(event_name, EVENT_TEAMPLAY_WAITING_BEGINS);
	
	PrintToServer("WaitingForPlayers: %s", Bool[WarmupActive]);
}
*/

/* Disabled because these particularily doesn't wanna work properly on TF2 Classic.
public void TF2_OnWaitingForPlayersStart()	{ WarmupActive = true; }
public void TF2_OnWaitingForPlayersEnd()	{ WarmupActive = false; }
*/

/**
 *	When player killed a class.
 *
 *	@param	client	The user index who killed.
 *	@param	victim	The user index who got killed.
 */
stock void TF2_ClientKillVictim(int client, int victim)	{
	if(IsValidAbuse(client)) return;
	
	TFClassType type = TF2_GetPlayerClass(victim);
	if(type < TFClass_Scout) {
		XStats_DebugText(false, "Tried updating for invalid class id %i from %s, ignoring..\n", type, Player[victim].Playername);
		return; /* Make sure it's a valid class. */
	}
	
	char class_kills[][] = {
		"Error like actually",
		"ScoutKills",
		"SniperKills",
		"SoldierKills",
		"DemoKills",
		"MedicKills",
		"HeavyKills",
		"PyroKills",
		"SpyKills",
		"EngieKills",
		"CivilianKills"
	}, class_deaths[][] = {
		"Definitely an error",
		"ScoutDeaths",
		"SniperDeaths",
		"SoldierDeaths",
		"DemoDeaths",
		"MedicDeaths",
		"HeavyDeaths",
		"PyroDeaths",
		"SpyDeaths",
		"EngieDeaths",
		"CivilianDeaths"
	};
	
	switch(type) {
		case TFClass_Scout: Player[client].Session.ScoutKills++;
		case TFClass_Soldier: Player[client].Session.SoldierKills++;
		case TFClass_Pyro: Player[client].Session.PyroKills++;
		case TFClass_DemoMan: Player[client].Session.DemoKills++;
		case TFClass_Heavy: Player[client].Session.HeavyKills++;
		case TFClass_Engineer: Player[client].Session.EngieKills++;
		case TFClass_Medic: Player[client].Session.MedicKills++;
		case TFClass_Sniper: Player[client].Session.SniperKills++;
		case TFClass_Spy: Player[client].Session.SpyKills++;
		case TFClass_Civilian: Player[client].Session.CivilianKills++; /* TF2 Classic */
	}
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set %s = %s+1 where SteamID='%s' and ServerID = %i",
	Global.playerlist, class_kills[type], class_kills[type], Player[client].SteamID, Cvars.ServerID.IntValue);
	XStats_DebugText(false, "Updating %s kills for %s (\"%s\")", TF2_ClassTypeName[type], Player[client].Playername, class_kills[type]);
	
	if(IsFakeClient(victim)) return; // Continue only if it's not a bot.
	
	switch(type) {
		case TFClass_Scout: Player[client].Session.ScoutDeaths++;
		case TFClass_Soldier: Player[client].Session.SoldierDeaths++;
		case TFClass_Pyro:  Player[client].Session.PyroDeaths++;
		case TFClass_DemoMan: Player[client].Session.DemoDeaths++;
		case TFClass_Heavy: Player[client].Session.HeavyDeaths++;
		case TFClass_Engineer: Player[client].Session.EngieDeaths++;
		case TFClass_Medic: Player[client].Session.MedicDeaths++;
		case TFClass_Sniper: Player[client].Session.SniperDeaths++;
		case TFClass_Spy: Player[client].Session.SpyDeaths++;
		case TFClass_Civilian: Player[client].Session.CivilianDeaths++; /* TF2 Classic */
	}
	
	SQL.QueryEx(DBQuery_Callback, "update `%s` set %s = %s+1 where SteamID='%s' and ServerID = %i",
	Global.playerlist, class_deaths[type], class_deaths[type], Player[victim].SteamID, Cvars.ServerID.IntValue);
	XStats_DebugText(false, "Updating %s deaths for %s (\"%s\")\n", TF2_ClassTypeName[type], Player[victim].Playername, class_deaths[type]);
}