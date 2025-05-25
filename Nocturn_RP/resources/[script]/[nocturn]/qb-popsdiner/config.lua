Config = {}



Config.Debug = true -- false to remove green boxes

Config.link = "qb-inventory/html/images/" --Set this to the image directory of your inventory script

Config.Locations = {
    [1] = {
		zoneEnable = true,
        label = "popsdiner", -- Set this to the required job
        zones = {
			vector2(1558.0170898438, 6442.4106445312),
			vector2(1601.52734375, 6424.2348632812),
			vector2(1610.9509277344, 6449.2001953125),
			vector2(1613.7552490234, 6464.6137695312),
			vector2(1575.8428955078, 6482.0229492188)
        },
		blip = vector3(1583.98, 6449.49, 25.18),
		blipcolor = 48,
    },
}
