#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

init()
{
	thread motd_solo();
}

motd_solo()
{
	//level waittill_multiple( "nixie_final_" + 386, "nixie_final_" + 481, "nixie_final_" + 101, "nixie_final_" + 872 );
	level waittill( "say" );
	while ( true )
	{
		if ( getPlayers().size == 1 )
		{
			if ( getdvarint( "sv_maxclients" ) < 2 )
				setdvar( "sv_maxclients", 2 );
			if ( getdvarint( "com_maxclients" ) < 2 )
				setdvar( "com_maxclients", "2" );

			bot = addtestclient();
			bot waittill( "spawned_player" );
			wait_network_frame();
			wait 3; //spawn protection
			bot.ignoreme = 1;
			break;
		}
		wait 5;
	}
}
