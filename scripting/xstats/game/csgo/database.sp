/**
 *	Prepare database.
 */
void PrepareDB_CSGO()
{
	char query[8192];
	int len = 0;
	
	len += Format(query[len], sizeof(query)-len, "create table if not exists `playerlist_csgo`");
	len += Format(query[len], sizeof(query)-len, "(");
	len += Format(query[len], sizeof(query)-len, "`Points`						int(32)			not null default '1000',");
	len += Format(query[len], sizeof(query)-len, "`Seed`						int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`SeedNeeded`					int(32)			not null default '50',");
	len += Format(query[len], sizeof(query)-len, "`PlayTime`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Playername`					varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`SteamID`						varchar(64)		not null default '',");
	len	+= Format(query[len], sizeof(query)-len, "`IPAddress`					varchar(64)		not null default '127.0.0.1',");
	len += Format(query[len], sizeof(query)-len, "`Headshots`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`ThruSmokes`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`KnifeKills`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills`						int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Deaths`						int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Suicides`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Assists`						int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Noscopes`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Dominations`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Revenges`					int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_SelfNade`				int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_hegrenade`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_flashbang`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_smokegrenade`	int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_deagle`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_glock`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_ak47`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_aug`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_awp`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_famas`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_g3sg1`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_galilar`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_m249`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_m4a1`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_mac10`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_p90`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_mp5sd`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_ump45`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_xm1014`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_bizon`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_mag7`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_negev`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_sawedoff`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_tec9`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_taser`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_hkp2000`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_mp7`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_mp9`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_nova`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_p250`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_scar20`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_sg556`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_ssg08`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_m4a1_silencer`	int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_usp_silencer`	int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_cz75a`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_revolver`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_knife`			int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Kills_weapon_knife_t`		int(32)			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "primary key (`SteamID`)");
	len += Format(query[len], sizeof(query)-len, ")");
	db.Query(DBQuery_DB_CSGO, query, 1);
	
	//Reset for new query.
	query = "";
	len = 0;
	
	len += Format(query[len], sizeof(query)-len, "create table if not exists `kill_log_csgo`");
	len += Format(query[len], sizeof(query)-len, "(");
	len += Format(query[len], sizeof(query)-len, "`ID`							int(32)			not null auto_increment,");
	len += Format(query[len], sizeof(query)-len, "`Playername`					varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`SteamID`						varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Victim_Playername`			varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Victim_SteamID`				varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Assister_Playername`			varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Assister_SteamID`			varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Timestamp`					timestamp		not null default current_timestamp,");
	len += Format(query[len], sizeof(query)-len, "`Weapon`						varchar(64)		not null default '',");
	len += Format(query[len], sizeof(query)-len, "`Headshot`					bool			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`Noscope`						bool			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`ThruSmoke`					bool			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "`BlindedKill`					bool			not null default '0',");
	len += Format(query[len], sizeof(query)-len, "primary key (`ID`)");
	len += Format(query[len], sizeof(query)-len, ")");
	db.Query(DBQuery_DB_CSGO, query, 2);
}

void DBQuery_DB_CSGO(Database database, DBResultSet results, const char[] error, int data)
{
	if(results == null)
	{
		SetFailState("[xStats: CSGO] Creating query for database table id %i failed! (%s)", data, error);
	}
}