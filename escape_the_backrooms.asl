state("Backrooms-Win64-Shipping") {}

startup
{
    //settings.Add("hub_auto_reset", false, "The Hub mode automatic reset");

	Assembly.Load(File.ReadAllBytes("Components/uhara9")).CreateInstance("Main");
    vars.Uhara.AlertLoadless();
    vars.Uhara.EnableDebug();

    vars.HasStarted = false;
    vars.HasExited = false;
}

init
{
	vars.Events = vars.Uhara.CreateTool("UnrealEngine", "Events");
    vars.Resolver.Watch<ulong>("LoadingStart", vars.Events.FunctionFlag("WB_LoadingScreen_C", "WB_LoadingScreen_C", "OnInitialized"));
    vars.Resolver.Watch<ulong>("LoadingFromRestart", vars.Events.FunctionFlag("MP_PlayerController_C", "MP_PlayerController_C", "ServerNotifyLoadedWorld"));
    vars.Resolver.Watch<ulong>("LoadingFinish", vars.Events.FunctionFlag("MP_PlayerController_C", "MP_PlayerController_C", "ServerAcknowledgePossession"));
    vars.Resolver.Watch<ulong>("MainMenu", vars.Events.FunctionFlag("MP_PlayerController_C", "MP_PlayerController_C", "ReceiveEndPlay"));
    vars.Resolver.Watch<ulong>("LoadingEnding", vars.Events.FunctionFlag("", "", "ExecuteUbergraph_BP_ExitZone_GameEnding"));
    vars.Resolver.Watch<ulong>("ReturnedToLobby", vars.Events.FunctionFlag("WB_Button_RestartGame_C", "WB_Button_RestartGame_C", "BndEvt__WB_Button_Close_Button_K2Node_ComponentBoundEvent_0_OnButtonClickedEvent__DelegateSignature"));
    vars.Resolver.Watch<ulong>("DeathHub", vars.Events.FunctionFlag("GameEnd_UI_2_C", "GameEnd_UI_2_C", "PreConstruct"));

    vars.WasEnding = false;
	vars.LoadingState = true;
}

start
{
    if (!vars.LoadingState && !vars.HasStarted) {
        vars.HasStarted = true;
        return true;
    }
}

update
{
    vars.Uhara.Update();

	if ((old.LoadingStart != current.LoadingStart) || (old.LoadingFromRestart != current.LoadingFromRestart) || (old.MainMenu != current.MainMenu) || (old.LoadingEnding != current.LoadingEnding)) vars.LoadingState = true;
    if (old.MainMenu != current.MainMenu) vars.HasExited = true;
    if ((old.LoadingFinish != current.LoadingFinish) && vars.LoadingState) {
        vars.LoadingState = false;
        vars.HasExited = false;
    }
}

split
{
    if ((old.LoadingStart != current.LoadingStart) && !vars.HasExited) {
        if (vars.WasEnding) {
            vars.WasEnding = false;
            return false;
        }
        return true;
    }
    if (old.LoadingEnding != current.LoadingEnding) {
        vars.WasEnding = true;
        return true;
    }
}

reset
{
    //if ((settings["hub_auto_reset"]) && (((old.ReturnedToLobby != current.ReturnedToLobby) || (old.DeathHub != current.DeathHub)) && (old.LoadingStart != current.LoadingStart))) return true;
    if (((old.ReturnedToLobby != current.ReturnedToLobby) || (old.DeathHub != current.DeathHub)) && (old.LoadingStart != current.LoadingStart)) return true;
}

isLoading
{
	return vars.LoadingState;
}

onReset
{
    vars.HasStarted = false;
    vars.HasExited = false;
    vars.WasEnding = false;
	vars.LoadingState = true;
}

exit
{
    vars.HasExited = true;
    vars.WasEnding = false;
    vars.LoadingState = true;
    timer.IsGameTimePaused = true;
}