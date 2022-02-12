#include common_scripts/utility;
#include maps/mp/_demo;
#include maps/mp/_utility;
#include maps/mp/_visionset_mgr;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/gametypes_zm/_weapons;
#include maps/mp/gametypes_zm/_zm_gametype;
#include maps/mp/zombies/_zm;
#include maps/mp/zombies/_zm_ai_basic;
#include maps/mp/zombies/_zm_ai_dogs;
#include maps/mp/zombies/_zm_audio;
#include maps/mp/zombies/_zm_audio_announcer;
#include maps/mp/zombies/_zm_blockers;
#include maps/mp/zombies/_zm_bot;
#include maps/mp/zombies/_zm_buildables;
#include maps/mp/zombies/_zm_clone;
#include maps/mp/zombies/_zm_devgui;
#include maps/mp/zombies/_zm_equipment;
#include maps/mp/zombies/_zm_ffotd;
#include maps/mp/zombies/_zm_game_module;
#include maps/mp/zombies/_zm_gump;
#include maps/mp/zombies/_zm_laststand;
#include maps/mp/zombies/_zm_magicbox;
#include maps/mp/zombies/_zm_melee_weapon;
#include maps/mp/zombies/_zm_perks;
#include maps/mp/zombies/_zm_pers_upgrades;
#include maps/mp/zombies/_zm_pers_upgrades_system;
#include maps/mp/zombies/_zm_pers_upgrades_functions;
#include maps/mp/zombies/_zm_playerhealth;
#include maps/mp/zombies/_zm_powerups;
#include maps/mp/zombies/_zm_power;
#include maps/mp/zombies/_zm_score;
#include maps/mp/zombies/_zm_sidequests;
#include maps/mp/zombies/_zm_spawner;
#include maps/mp/zombies/_zm_stats;
#include maps/mp/zombies/_zm_timer;
#include maps/mp/zombies/_zm_tombstone;
#include maps/mp/zombies/_zm_traps;
#include maps/mp/zombies/_zm_unitrigger;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm_zonemgr;

init()
{
	level thread rotate_skydome();
	level thread change_skydome();
	level thread onPlayerConnect();
}

rotate_skydome()
{
	if ( level.script == "zm_tomb" )
	{
		return;
	}
	level.sky_rotation = 360;
	for(;;)
	{
		level.sky_rotation -= 0.025;
		if ( level.sky_rotation < 0 )
		{
			level.sky_rotation += 360;
		}
		setdvar( "r_skyRotation", level.sky_rotation );
		wait 0.1;
	}
}

change_skydome()
{
	level.sky_change = 6500;
	for(;;)
	{
		level.sky_change += 1.626;
		if ( level.sky_change > 25000 )
		{
			level.sky_change -= 23350;
		}
		setdvar( "r_skyColorTemp", level.sky_change );
		wait 0.1;
	}
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);
		player setclientdvar("r_fog", 0);
		player setclientdvar("r_dof_enable", 0);
		player setclientdvar("r_lodBiasRigid", -1000);
		player setclientdvar("r_lodBiasSkinned", -1000);
		player setClientDvar("r_lodScaleRigid", 1);
		player setClientDvar("r_lodScaleSkinned", 1);
		player setclientdvar("r_enablePlayerShadow", 1);
		player setclientdvar("sm_sunquality", 2);
		player useservervisionset(1);
		player setvisionsetforplayer("", 0);
	}
}