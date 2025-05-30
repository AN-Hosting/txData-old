
--[[ Citizen.CreateThread( function()
    SetPedHelmet(GetPlayerPed(-1), false)
    
        while true do
            Citizen.Wait(0)		
            local playerPed = GetPlayerPed(-1)
            local playerVeh = GetVehiclePedIsUsing(playerPed)
    
            if PlayerVeh ~= 30000 then RemovePedHelmet(playerPed,true) end
        end
        
    end)

AddEventHandler("playerSpawned", function(spawn)
    SetCanAttackFriendly(GetPlayerPed(-1), true, false)
  NetworkSetFriendlyFireOption(true)
  SetPedCanRagdollFromPlayerImpact(GetPlayerPed(-1), true)
--NO HELMET--
  SetPedHelmet(GetPlayerPed(-1), false)
end) ]]

Citizen.CreateThread( function()
	while true do 
		REVEL = 1000
		if IsPedInAnyVehicle(PlayerPedId(), false) then 
		REVEL = 1
	  SetPedConfigFlag(PlayerPedId(), 35, false)
		end
      Citizen.Wait(REVEL)
	end
  end)
    