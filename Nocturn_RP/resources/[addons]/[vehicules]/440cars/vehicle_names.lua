-- 5M EXCLUSIVE-VEHICLES 
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry("dl550mec", "Bennys Flatbed")
	AddTextEntry("dl450mec", "Bennys TowTruck")
	AddTextEntry("dlmustmec", "Bennys Sportscar")
end)
