// Copyright (C) 2023 Katsute | Licensed under CC BY-NC-SA 4.0

#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {
    name        = "No Truce",
    author      = "Katsute",
    description = "Force disable truce mode",
    version     = "1.0",
    url         = "https://github.com/KatsuteTF/No-Truce"
}

int gamerules;

public void OnPluginStart(){
    gamerules = FindEntityByClassname(-1, "tf_gamerules");

    if(gamerules != -1)
        HookSingleEntityOutput(gamerules, "OnTruceStart", OnTruce);
}

public void OnTruce(const char[] output, int caller, int activator, float delay){
    GameRules_SetProp("m_bTruceActive", false);
}