-- Do not edit anything here

Citizen.CreateThread(function()


RequestIpl("subham_driveline_milo_")

    interiorID = GetInteriorAtCoords(-816.0656, -433.922821, 37.5788269)
        
    
    if IsValidInterior(interiorID) then      
            EnableInteriorProp(interiorID, "driveline_storage_props")
            EnableInteriorProp(interiorID, "driveline_locker_props")
            EnableInteriorProp(interiorID, "driveline_meeting_props")
            EnableInteriorProp(interiorID, "driveline_corridor_props")
            EnableInteriorProp(interiorID, "driveline_boss_props")
            EnableInteriorProp(interiorID, "driveline_bar_props")
            EnableInteriorProp(interiorID, "driveline_mechanic_props")
            EnableInteriorProp(interiorID, "driveline_counter_props")
            EnableInteriorProp(interiorID, "driveline_misc_props")
            
    RefreshInterior(interiorID)

    print("Driveline Customs is ready to use. Do not edit anything to ensure a smooth experience")

    end

end)