print("^2Jim^7-^2Burgershot ^7v^42^7.^44^7.^49 ^7- ^2BurgerShot Job Script by ^1Jimathy^7")

Config = {
	Debug = true,  -- True to show debug boxes and messages

	--https://i.imgur.com/NIFOsYf.jpeg

	Lan = "fr", -- Pick your language here
	img = "qs-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	Core = "qb-core", -- set this to your core folder
	Inv = "qb", -- set to "ox" if using OX Inventory
	Menu = "qb", -- set to "ox" if using OX Lib Context
	Notify = "qb",
	ProgressBar = "qb", -- set to "ox" if using ox_lib progressbar

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10] },

	JimConsumables = false, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, 		-- Enable this to use jim-shops for buying ingredients


	--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
		"",
	},

	Items = {
		label = "Storage",
		slots = 9,
		items = {
			{ name = 'burgerpatty', price = 6, amount = 200, info = {}, type = 'item', slot = 1, },
			{ name = 'potato', price = 3, amount = 200, info = {}, type = 'item', slot = 2, },
			{ name = 'onion', price = 3, amount = 200, info = {}, type = 'item', slot = 3, },
			{ name = 'frozennugget', price = 6, amount = 200, info = {}, type = 'item', slot = 4, },
			{ name = 'milk', price = 3, amount = 200, info = {}, type = 'item', slot = 5, },
			{ name = 'icecream', price = 6, amount = 200, info = {}, type = 'item', slot = 6, },
			{ name = 'burgerbun', price = 4, amount = 200, info = {}, type = 'item', slot = 7, },
			{ name = 'cheddar', price = 3, amount = 200, info = {}, type = 'item', slot = 8, },
			{ name = 'lettuce', price = 2, amount = 200, info = {}, type = 'item', slot = 9, },
		},
	},
	Locations = {
		{ 	
			zoneEnable = true,
			job = "burgershot",
			label = "Burger Shot",
			autoClock = { enter = false, exit = false, },
			zones = {
				vec2(-1153.6727294922, -892.29083251953),
				vec2(-1174.5604248047, -860.27191162109),
				vec2(-1217.4858398438, -889.26123046875),
				vec2(-1196.4073486328, -917.87731933594)
			},
			-- blip = vec3(-1186.11, -885.86, 13.97), blipcolor = 5, blipsprite = 106, blipscale = 0.7, blipdisp = 6, blipcat = nil,
			garage = { spawn = vec4(0.86, 0.18, 0.51, 0.85),
				out = vec4(-0.59, -0.41, 0.37, 0.18),
				list = { "stalion2", "burrito3", }
			},
			MLO = "JX",   --use "Gabz" if you are using Smallo's burgershot MLO
							--use "LP" if you are using Smallo's burgershot MLO
							--use "RZ" if you are using NoPixels Paid burgershot MLO
							--use "GN" if you are using GNMods burgershot MLO
							--use "NP" if you are using NoPixels Paid burgershot MLO
                            --JX ------ this works with the included burgershot mlo ------
		},
	},
}
Crafting = {
	ChopBoard = {
		{ ['slicedonion'] = { ['onion'] = 1, },
			['amount'] = 3 },
		{ ['slicedpotato'] = { ['potato'] = 1, },
			['amount'] = 3 },
		{ ['chickenwrap'] = { ['shotnuggets'] = 1, ['lettuce'] = 1, } },
		{ ['cheesewrap'] = { ['cheddar'] = 1, ['lettuce'] = 1, } },
	},
	Fryer = {
		{ ['shotfries'] = { ['slicedpotato'] = 1, } },
		{ ['shotrings'] = { ['slicedonion'] = 1, } },
		{ ['shotnuggets'] = { ['frozennugget'] = 1, } },
	},
	Grill = {
		{ ['burgermeat'] = { ['burgerpatty'] = 1, } },
	},
	Prepare = {
		{ ['heartstopper'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['bleeder'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['torpedo'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['meatfree'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['slicedonion'] = 1,
		} },
		{ ['moneyshot'] = {
				['burgerbun'] = 1,
				['cheddar'] = 1,
				['lettuce'] = 1,
				['burgermeat'] = 1,
				['slicedonion'] = 1,
		} },
	},
	Drink = {
		{ ['water_bottle'] = { } },
		{ ['bscoke'] = { } },
		{ ['bscoffee'] = { } },
		{ ['milkshake'] = { ['milk'] = 1, ['icecream'] = 1, } },
	},
	Donut = {
		{ ["rimjob"] = {} },
		{ ["creampie"] = {} },
	},
}

Loc = {}