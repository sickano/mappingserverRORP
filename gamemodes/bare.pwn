#include <a_samp>
#include <streamer>
#include <core>
#include <float>
#include <zcmd>
#include <sscanf2>
#include <foreach>

#pragma tabsize 0

#define DIALOG_HELP 1

new Text:RORP;

/*
	Variables
________________________________________________________________________________
*/



/*
	Hooks
________________________________________________________________________________
*/

public OnGameModeExit() {
	return 1;
}

main()
{
	print("\n----------------------------------");
	print("Se porneste...");
	print("----------------------------------\n");
}

CMD:goto(playerid, params[])
{
     new ID;
     new pn[MAX_PLAYER_NAME];
     new an[MAX_PLAYER_NAME];
     new str[128];
     if(sscanf(params, "u", ID)) return SendClientMessage(playerid, 0xFF0000AA, "USAGE: /goto [ID]"); //This is a long line, "sscanf" is the plugin that search the missing params, "params" is the param that define params LOL, "u" is the PARAM that define the MISSING ID, ID is the param for the targetid
     if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, 0xFF0000AA, "ERROR: This player is not connected");//Same as !IsPlayerAdmin, but instead of "playerid" we put "ID" because it's the targetid
     GetPlayerName(playerid, an, MAX_PLAYER_NAME);//Define the playerid's param
     GetPlayerName(ID, pn, MAX_PLAYER_NAME);//Define the ID's param
     new Float:x; //Defining float X
     new Float:y; //Same
     new Float:z; //Same
     GetPlayerPos(ID, x, y, z); //This line get the "ID" position
     SetPlayerPos(playerid, x+1, y+1, z); //This line set the "playerid" position from "ID" position, with some changes(x+1, y+1);
     format(str, sizeof(str), "You have been teleported to %s", pn); //Showed before, this is the line that give the message to playerid)
     SendClientMessage(playerid, 0x00FF00AA, str); //This line give the message to playerid
     if(IsPlayerInAnyVehicle(playerid)) //Mhh, let's give you a question, what should this callback do?
     {
          GetPlayerPos(ID, x, y, z);
          SetVehiclePos(playerid, x+1, y+1, z); //And this one? :D
     }
     return 1;
}

CMD:heal(playerid, params[])
{
    SetPlayerHealth(playerid, 100);
	SendClientMessage(playerid, -1, "u now healed boi ;)");
	return 1;
}

CMD:givegun(playerid, params[])
{
		new target, gun;
        if(sscanf(params, "ud", target, gun)) return SendClientMessage(playerid, -1, "Usage: /givegun <playerid> <gun>");
        if(gun < 1 || gun > 47) return SendClientMessage(playerid, -1, "Don't go below 1 or above 47.");
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "User is not connected!");
        if(gun != 21)
        {
            GivePlayerWeapon(target, gun, 50000); //Your version would be GivePlayerValidWeapon, this also may be causing issues.
        }
        return 1;
}

CMD:tp(playerid, params[])
{
	new Float:x,Float:y,Float:z; 
	if(sscanf(params,"fff", x, y, z)) return SendClientMessage(playerid, 0xFFFFFFF,"/tp [x] [y] [z]");
	SetPlayerPos(playerid, x, y, z);
	return 1;
}

CMD:int(playerid, params[])
{
	new int; 
	if(sscanf(params,"i", int)) return SendClientMessage(playerid, 0xFFFFFFF,"/int [id]");
	SetPlayerInterior(playerid,int);
	return 1;
}

CMD:vw(playerid, params[])
{
	new int; 
	if(sscanf(params,"i", int)) return SendClientMessage(playerid, 0xFFFFFFF,"/vw [id]");
	SetPlayerVirtualWorld(playerid,int);
	return 1;
}

CMD:skin(playerid, params[])
{
	new nr; 
	if(sscanf(params,"i", nr)) return SendClientMessage(playerid, 0xFFFFFFF,"/skin [nr]");
	SetPlayerSkin(playerid, nr);
	return 1;
}

CMD:verona(playerid, params[])
{
    SetPlayerPos(playerid, 1117, -1490, 25);
    SendClientMessage(playerid, 0x4c7794, "succes");
	return 1;
}
CMD:dumalajefferson(playerid, params[])
{
	SetPlayerPos(playerid, 2163.4126,-1351.7109,23.8281);
	SendClientMessage(playerid, 0x4c7794, "succes");
	return 1;
}
CMD:dumalaganton(playerid, params[])
{
	SetPlayerPos(playerid, 2332.7981,-1725.7747,13.5341);
	SendClientMessage(playerid, 0x4c7794, "succes");
	return 1;
}
CMD:dumalapecosud(playerid, params[])
{
	SetPlayerPos(playerid, 1942.8359,-1757.9414,13.3828);
	SendClientMessage(playerid, 0x4c7794, "succes");
	return 1;
}

CMD:weather(playerid, params[])
{
	new id; 
	if(sscanf(params,"i", id)) return SendClientMessage(playerid, 0xFFFFFFF,"/weather [id]");
	SetPlayerWeather(playerid, id);
	return 1;
}
CMD:help(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_MSGBOX, "{4c7794}Comenzi Mapping Server", "{4c7794}/goto /heal /givegun /tp /int /vw \n/skin /verona /dumalajefferson\n/dumalaganton /weather /time ", "IEI", "MUIE");
	return 1;
}

CMD:time(playerid, params[])
{
	new id; 
	if(sscanf(params,"i", id)) return SendClientMessage(playerid, 0xFFFFFFF,"/time [id]");
	SetPlayerTime(playerid,id,0);
	return 1;
}

public OnPlayerConnect(playerid)
{	
	RORP = TextDrawCreate(3.999991, 435.985168, "RO-RP_MAPPING_SERVER");
	TextDrawLetterSize(RORP, 0.176999, 0.948740);
	TextDrawAlignment(RORP, 1);
	TextDrawColor(RORP, -10223361);
	TextDrawSetShadow(RORP, 0);
	TextDrawSetOutline(RORP, 1);
	TextDrawBackgroundColor(RORP, 255);
	TextDrawFont(RORP, 2);
	TextDrawSetProportional(RORP, 1);
	TextDrawSetShadow(RORP, 0);

	GameTextForPlayer(playerid,"~w~RO-RP: ~r~MAPPING SERVER",5000,5);
	GivePlayerMoney(playerid, 99999999);

	//verona
	RemoveBuildingForPlayer(playerid, 6130, 1117.5859, -1490.0078, 32.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 6255, 1117.5859, -1490.0078, 32.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 762, 1175.3594, -1420.1875, 19.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 615, 1166.3516, -1417.6953, 13.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 615, 1182.0469, -1418.6250, 13.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 759, 1183.1875, -1421.2734, 14.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 759, 1182.8125, -1418.8516, 14.3047, 0.25);
	
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1341.8516, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1328.0938, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1356.2109, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1353.5000, 12.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1343.2656, 12.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1292.9141, 12.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1303.1484, 12.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1374.6094, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1356.5547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1374.6094, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1356.5547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1335.0547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1317.7422, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1335.0547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1317.7422, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1300.9219, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1300.9219, 12.2969, 0.25);

	
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_HELP)
    {
        if(response) // If they clicked 'Yes' or pressed enter
        {
            SendClientMessage(playerid, 0x4c7794, "Stiu ca iei muie :(");
        }
        else // Pressed ESC or clicked cancel
        {
            SendClientMessage(playerid, 0x4c7794, "Stiu ca iei muie de 2 ori :(");
        }
        return 1; // We handled a dialog, so return 1. Just like OnPlayerCommandText.
    }
 
    return 0; // You MUST return 0 here! Just like OnPlayerCommandText.
}
public OnPlayerSpawn(playerid)
{
	TextDrawShowForPlayer(playerid, Text:RORP);
	SendClientMessage(playerid, 0x4c7794, "Foloseste /help pentru comenzi sefule");
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SendClientMessage(playerid, 0xFFFFFFAA, "U suck fag XD");
    ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, 99999999);
   	return 1;
}

SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 360.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    SetPlayerPosFindZ(playerid, fX, fY, fZ);
    return 1;
}

public OnGameModeInit()
{	
	SetGameModeText("Bare Script");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);
	
	//verona
	CreateDynamicObject(19322, 1117.58594, -1490.00781, 32.71880,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19323, 1117.58594, -1490.00781, 32.71880,   0.00000, 0.00000, 0.00000);
	
	AddPlayerClass(293,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);
	return 1;
}
