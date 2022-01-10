/**
 *	Functions.
 */
ConVar	BombEvent[3];

void PrepareGame_CounterStrike()	{
	BombEvent[0] = CreateConVar("xstats_points_bomb_planted",	"2", "xStats: Counter-Strike - Points given when planting the bomb.", _, true);
	BombEvent[1] = CreateConVar("xstats_points_bomb_defused",	"2", "xStats: Counter-Strike - Points given when defusing the bomb.", _, true);
	BombEvent[2] = CreateConVar("xstats_points_bomb_exploded",	"2", "xStats: Counter-Strike - Points given when bomb explodes.", _, true);
	
	/* Events */
	HookEventEx(EVENT_BOMB_PLANTED,		CS_Bombs, EventHookMode_Pre);
	HookEventEx(EVENT_BOMB_DEFUSED,		CS_Bombs, EventHookMode_Pre);
	HookEventEx(EVENT_BOMB_EXPLODED,	CS_Bombs, EventHookMode_Pre);
	
	HookEventEx(EVENT_ROUND_END,	CS_Round, EventHookMode_Pre);
	HookEventEx(EVENT_ROUND_START,	CS_Round, EventHookMode_Pre);
}

/**
 *	These events are only called in Counter-Strike.
 *	- Counter-Strike: Source.
 *	- Counter-Strike: Promod.
 *	- Counter-Strike: Global Offensive.
 *	- Counter-Strike: Classic Offensive.
 */

stock void CS_Bombs(Event event, const char[] event_name, bool dontBroadcast)	{
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	
	if(Tklib_IsValidClient(client, true))	{
		GetClientTeamString(client, Name[client], sizeof(Name[]));
		char query[256];
		int points = 0;
		
		if(StrEqual(event_name, EVENT_BOMB_PLANTED) && CS_GetClientTeam(client) == CSTeam_T)	{
			points = BombEvent[0].IntValue;
			
			Session[client].BombsPlanted++;
			Format(query, sizeof(query), "update `%s` set BombsPlanted = BombsPlanted+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_CS_Bombs, query);
			
			if(points > 0)	{
				Session[client].Points = Session[client].Points+points;
				Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s'", playerlist, points, SteamID[client]);
				db.Query(DBQuery_CS_Bombs, query);
				int points_client = GetClientPoints(SteamID[client]);
				
				CPrintToChat(client, "%s %s (%i) earned %i points for planting the bomb.",
				Prefix, Name[client], points_client, points);
			}
		}
		
		if(StrEqual(event_name, EVENT_BOMB_DEFUSED) && CS_GetClientTeam(client) == CSTeam_CT)	{
			points = BombEvent[1].IntValue;
			
			Session[client].BombsDefused++;
			Format(query, sizeof(query), "update `%s` set BombsDefused = BombsDefused+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_CS_Bombs, query);
			
			if(points > 0)	{
				Session[client].Points = Session[client].Points+points;
				Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s'", playerlist, points, SteamID[client]);
				db.Query(DBQuery_CS_Bombs, query);
				int points_client = GetClientPoints(SteamID[client]);
				
				CPrintToChat(client, "%s %s (%i) earned %i points for defusing the bomb.",
				Prefix, Name[client], points_client, points);
			}
		}
		
		if(StrEqual(event_name, EVENT_BOMB_EXPLODED) && CS_GetClientTeam(client) == CSTeam_T)	{
			points = BombEvent[2].IntValue;
			
			Session[client].BombsExploded++;
			Format(query, sizeof(query), "update `%s` set BombsDefused = BombsDefused+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_CS_Bombs, query);
			
			if(points > 0)	{
				Session[client].Points = Session[client].Points+points;
				Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s'", playerlist, points, SteamID[client]);
				db.Query(DBQuery_CS_Bombs, query);
				int points_client = GetClientPoints(SteamID[client]);
				
				CPrintToChat(client, "%s %s (%i) earned %i points for letting bomb explode.",
				Prefix, Name[client], points_client, points);
			}
		}
	}
}

void DBQuery_CS_Bombs(Database database, DBResultSet results, const char[] error, any data)	{
	if(results == null)
		SetFailState("[Xstats: CS] Updating player table for bomb event failed! (%s)", error);
}

stock void CS_Round(Event event, const char[] event_name, bool dontBroadcast)	{
	switch(StrEqual(event_name, EVENT_ROUND_END))	{
		case	true:	{
			RoundEnded();
			ResetAssister();
		}
		case	false:	RoundStarted();
	}
}