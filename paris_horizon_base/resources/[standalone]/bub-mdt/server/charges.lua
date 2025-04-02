local utils = require 'server.utils'

local chargeCategories = {
	['INFRACTIONS CONTRE LES PERSONNES'] = 'Infractions contre les personnes',
	['INFRACTIONS IMPLIQUANT LE VOL'] = 'Infractions impliquant le vol',
	['INFRACTIONS IMPLIQUANT LA FRAUDE'] = 'Infractions impliquant la fraude',
	['INFRACTIONS IMPLIQUANT DES DOMMAGES AUX BIENS'] = 'Infractions impliquant des dommages aux biens',
	['INFRACTIONS CONTRE L ADMINISTRATION PUBLIQUE'] = 'Infractions contre l administration publique',
	['INFRACTIONS CONTRE L ORDRE PUBLIQUE'] = 'Infractions contre l ordre public',
	['INFRACTIONS CONTRE LA SANTÉ ET LA MORALE'] = 'Infractions contre la santé et la morale',
	['INFRACTIONS CONTRE LA SÉCURITÉ PUBLIQUE'] = 'Infractions contre la sécurité publique',
	['INFRACTIONS LIÉES À LA CONDUITE D UN VÉHICULE'] = 'INFRACTIONS LIÉES À LA CONDUITE D UN VÉHICULE',
	['INFRACTIONS CONTRE LE BIEN-ÊTRE DE LA FAUNE'] = 'Infractions contre le bien-être de la faune',
}

local charges = {}

for category in pairs(chargeCategories) do
	charges[category] = {}
end

MySQL.ready(function()
	local dbCharges = MySQL.rawExecute.await('SELECT * FROM `mdt_offenses`')

	for i = 1, #dbCharges do
		local charge = dbCharges[i]
		charges[charge.category][#charges[charge.category]+1] = charge
	end
end)

utils.registerCallback('mdt:getAllCharges', function()
	return charges
end)