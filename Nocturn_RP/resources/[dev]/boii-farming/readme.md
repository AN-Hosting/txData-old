----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

# BOII | DEVELOPMENT - ACTIVITY: FARMING

Here we have one of the most indepth farming scripts you will find entirely for free!
Script includes a full synced planting system and a variety of other options. 
Full XP system with 13 levels of progression, can be toggled off in config.
Script also includes a full brewing side option where you citizens can brew their own moonshine or bootleg vodka!
Two drug types are also included, shrooms and peyote! 
Warhouse location included to sell or purchase crops!
Enjoy :)

### INSTALL ###

1) Customise `config.lua`, `language.lua` to your liking
2) If you have changed any crops names edit `sql.sql` accordingly
3) Insert the `sql.sql` provided into your servers database
4) Insert the line under **QB-CORE/SERVER/PLAYER.LUA** into your `qb-core/server/player.lua` in order for XP to work correctly
5) Insert item information provided under **QB-CORE/SHARED/ITEMS.LUA** into your `qb-core/shared/items.lua`
6) Copy images from `html/images/*` into your `qb-inventory/html/images` you do not need to copy the images from `html/images/guide` 
7) Drag and drop `boii-farming` into your server resources
8) Add `ensure boii-farming` into your `server.cfg` and ensure load order is correct
9) Restart server

**IF YOU WISH TO EDIT THE GUIDE YOU CAN DO SO IN HTML/GUIDE.HTML**

### QB-CORE/SERVER/PLAYER.LUA ###
-- Insert the following line around `LINE:80` do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

PlayerData.metadata['farmingxp'] = PlayerData.metadata['farmingxp'] or 0 -- Added for farming

### QB-CORE/SHARED.ITEMS.LUA ###

	--<!>-- BOII FARMING --<!>--
    -- Tools
    ['milking_pail']            = {['name'] = 'milking_pail',              	['label'] = 'Milking Pail',             ['weight'] = 250,       ['type'] = 'item',      ['image'] = 'milking_pail.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A milking pail for collecting milk!'},
    ['emptymilkbottle']         = {['name'] = 'emptymilkbottle',           	['label'] = 'Empty Milk Bottle',        ['weight'] = 100,       ['type'] = 'item',      ['image'] = 'emptymilkbottle.png',      	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty milk bottle!'},
    ['watering_can']          	= {['name'] = 'watering_can',           	['label'] = 'Watering Can',        		['weight'] = 100,       ['type'] = 'item',      ['image'] = 'watering_can.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty watering can!'},
    ['watering_can_full']       = {['name'] = 'watering_can_full',          ['label'] = 'Full Watering Can',        ['weight'] = 500,       ['type'] = 'item',      ['image'] = 'watering_can_full.png',      	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A watering can full of water!'},
    ['farm_fertilizer']       	= {['name'] = 'farm_fertilizer',          	['label'] = 'Fertilizer',        		['weight'] = 1500,      ['type'] = 'item',      ['image'] = 'farm_fertilizer.png',      	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bag of organic fertilizer!'},
    ['emptysack']       		= {['name'] = 'emptysack',          		['label'] = 'Sack',        				['weight'] = 100,      	['type'] = 'item',      ['image'] = 'emptysack.png',      			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty sack for storing crops!'},
    ['emptycrate']       		= {['name'] = 'emptycrate',          		['label'] = 'Crate',        			['weight'] = 100,      	['type'] = 'item',      ['image'] = 'emptycrate.png',      			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty crate for storing things!'},
    ['bucket']       			= {['name'] = 'bucket',          			['label'] = 'Bucket',        			['weight'] = 100,      	['type'] = 'item',      ['image'] = 'bucket.png',      				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty bucket!'},
    ['growler']       			= {['name'] = 'growler',          			['label'] = 'Growler',        			['weight'] = 100,      	['type'] = 'item',      ['image'] = 'growler.png',      			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A empty growler!'},
	['yeast']       			= {['name'] = 'yeast',          			['label'] = 'Yeast',        			['weight'] = 100,      	['type'] = 'item',      ['image'] = 'yeast.png',      				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A packet of yeast!'},
	['farmguide']       		= {['name'] = 'farmguide',          		['label'] = 'Farming Handbook',        	['weight'] = 100,      	['type'] = 'item',      ['image'] = 'farmguide.png',      			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Learn all about farming with this handbook!'},
    ['trowel']          	    = {['name'] = 'trowel', 			  			['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},

    -- Legal seeds
    ['barley_seed']             = {['name'] = 'barley_seed',               	['label'] = 'Barley Seed',              ['weight'] = 1,       	['type'] = 'item',      ['image'] = 'barley_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of barley seeds!'},
	['maize_seed']             	= {['name'] = 'maize_seed',               	['label'] = 'Maize Seed',              	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'maize_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of maize seeds!'},
 	['lettuce_seed']            = {['name'] = 'lettuce_seed',               ['label'] = 'Lettuce Seed',             ['weight'] = 1,       	['type'] = 'item',      ['image'] = 'lettuce_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of lettuce seeds!'},
	['potato_seed']             = {['name'] = 'potato_seed',               	['label'] = 'Potato Seed',              ['weight'] = 1,       	['type'] = 'item',      ['image'] = 'potato_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of seed potatoes!'},
 	['strawberry_seed']         = {['name'] = 'strawberry_seed',            ['label'] = 'Strawberry Seed',          ['weight'] = 1,       	['type'] = 'item',      ['image'] = 'strawberry_seed.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of strawberry seeds!'},
  	['blueberry_seed']         	= {['name'] = 'blueberry_seed',            	['label'] = 'Blueberry Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'blueberry_seed.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of blueberry seeds!'},
	['pineapple_seed']         	= {['name'] = 'pineapple_seed',            	['label'] = 'Pineapple Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'pineapple_seed.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of pineapple seeds!'},
   	['tomato_seed']         	= {['name'] = 'tomato_seed',            	['label'] = 'Tomato Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'tomato_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of tomato seeds!'},
    ['mushroom_seed']         	= {['name'] = 'mushroom_seed',            	['label'] = 'Mushroom Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'mushroom_seed.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of mushroom seeds!'},
    ['cactus_seed']         	= {['name'] = 'cactus_seed',            	['label'] = 'Cactus Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'cactus_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of cactus seeds!'},

	-- Illegal seeds
    ['peyote_seed']         	= {['name'] = 'peyote_seed',            	['label'] = 'Peyote Seed',          	['weight'] = 1,       	['type'] = 'item',      ['image'] = 'peyote_seed.png',        		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of peyote seeds!'},
    ['psilocybin_seed']         = {['name'] = 'psilocybin_seed',            ['label'] = 'Psilocybin Seed',          ['weight'] = 1,       	['type'] = 'item',      ['image'] = 'psilocybin_seed.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of psilocybin seeds!'},

	-- Brewing
	['moonshine_mash']       	= {['name'] = 'moonshine_mash',          	['label'] = 'Moonshine Mash',        	['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'moonshine_mash.png',      		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of moonshine mash!'},
	['vodka_mash']       		= {['name'] = 'vodka_mash',          		['label'] = 'Vodka Mash',        		['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'vodka_mash.png',      			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of vodka mash!'},
	['moonshine_ferm']       	= {['name'] = 'moonshine_ferm',          	['label'] = 'Fermented Moonshine',      ['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'moonshine_ferm.png',      		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of fermented moonshine!'},	
	['vodka_ferm']       		= {['name'] = 'vodka_ferm',          		['label'] = 'Fermented Vodka',      	['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'vodka_ferm.png',      			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of fermented vodka!'},	
	['moonshine_distill']       = {['name'] = 'moonshine_distill',          ['label'] = 'Distilled Moonshine',      ['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'moonshine_distill.png',      	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of distilled moonshine!'},	
	['vodka_distill']       	= {['name'] = 'vodka_distill',          	['label'] = 'Distilled Vodka',      	['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'vodka_distill.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bucket of distilled vodka!'},	

	['moonshine']       		= {['name'] = 'moonshine',          		['label'] = 'Moonshine',      			['weight'] = 500,      	 ['type'] = 'item',      ['image'] = 'moonshine.png',      			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bottle of moonshine!'},	
	['bootlegvodka']       		= {['name'] = 'bootlegvodka',          		['label'] = 'Bootleg Vodka',      		['weight'] = 500,      	 ['type'] = 'item',      ['image'] = 'bootlegvodka.png',      		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bottle of bootleg vodka!'},	

	-- Crops
    ['barley']                  = {['name'] = 'barley',                     ['label'] = 'Barley',               	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'barley.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Barley!'},
    ['maize']                  	= {['name'] = 'maize',                     	['label'] = 'Maize',               		['weight'] = 100,       ['type'] = 'item',      ['image'] = 'maize.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Maize!'},
    ['lettuce']                 = {['name'] = 'lettuce',                    ['label'] = 'Lettuce',               	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'lettuce.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Lettuce!'},
    ['potato']                  = {['name'] = 'potato',                     ['label'] = 'Potato',               	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'potato.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Potato!'},
    ['cactusfruit']             = {['name'] = 'cactusfruit',                ['label'] = 'Cactus Fruit',             ['weight'] = 100,       ['type'] = 'item',      ['image'] = 'cactusfruit.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Cactus Fruit!'},
    ['mushroom']              	= {['name'] = 'mushroom',                 	['label'] = 'Mushroom',              	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'mushroom.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Mushroom!'},
		
	-- Fruit
    ['orange'] 		            = {['name'] = 'orange', 			        ['label'] = 'Orange', 	                ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'orange.png', 	            	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'Orange!'},
	['apple'] 		            = {['name'] = 'apple', 			        	['label'] = 'Apple', 	                ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'apple.png', 	            	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'Apple!'},
	['strawberry'] 		        = {['name'] = 'strawberry', 			    ['label'] = 'Strawberry', 	            ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'strawberry.png', 	        	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'Straqwberry!'},
	['blueberry'] 		        = {['name'] = 'blueberry', 			    	['label'] = 'Blueberry', 	            ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'blueberry.png', 	        	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'Blueberry!'},
	['cherry']            		= {['name'] = 'cherry',             		['label'] = 'Cherry',     				['weight'] = 100,       ['type'] = 'item',      ['image'] = 'cherry.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Cherry!'},
	['lemon']            		= {['name'] = 'lemon',             			['label'] = 'Lemon',     				['weight'] = 100,       ['type'] = 'item',      ['image'] = 'lemon.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Lemon!'},	
	['pineapple']               = {['name'] = 'pineapple',             		['label'] = 'Pineapple',     			['weight'] = 100,       ['type'] = 'item',      ['image'] = 'pineapple.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Lemon!'},
	['coconut']            		= {['name'] = 'coconut',             		['label'] = 'Coconut',     				['weight'] = 100,       ['type'] = 'item',      ['image'] = 'coconut.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Coconut!'},
    ['tomato']                  = {['name'] = 'tomato',                     ['label'] = 'Tomato',               	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'tomato.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Tomato!'},

    -- Animals
    ['egg']              	 	= {['name'] = 'egg',               			['label'] = 'Egg',                		['weight'] = 50,       	['type'] = 'item',      ['image'] = 'egg.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Fresh eggs!'},
    ['milk_pail']              	= {['name'] = 'milk_pail',               	['label'] = 'Milk Pail',       			['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'milk_pail.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Fresh milk, straight from the cow!'},
    ['milk']              	 	= {['name'] = 'milk',               		['label'] = 'Milk',                		['weight'] = 250,       ['type'] = 'item',      ['image'] = 'milk.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A bottle of fresh milk!'},
    
    -- Deliveries
    ['barley_sack']             = {['name'] = 'barley_sack',                ['label'] = 'Barley Sack',              ['weight'] = 5000,       ['type'] = 'item',      ['image'] = 'barley_sack.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A sack of barley ready for selling!'},
	['maize_sack']             	= {['name'] = 'maize_sack',                	['label'] = 'Maize Sack',              	['weight'] = 5000,       ['type'] = 'item',      ['image'] = 'maize_sack.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A sack of maize ready for selling!'},	
	['potato_sack']             = {['name'] = 'potato_sack',                ['label'] = 'Potato Sack',              ['weight'] = 5000,       ['type'] = 'item',      ['image'] = 'potato_sack.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A sack of potatoes ready for selling!'},	
	['mushroom_sack']           = {['name'] = 'mushroom_sack',              ['label'] = 'Mushroom Sack',            ['weight'] = 5000,       ['type'] = 'item',      ['image'] = 'mushroom_sack.png',        	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A sack of mushrooms ready for selling!'},	
	['lettuce_crate']           = {['name'] = 'lettuce_crate',              ['label'] = 'Lettuce Crate',            ['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'lettuce_crate.png',        	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of lettuce ready for selling!'},	
	['cactusfruit_crate']       = {['name'] = 'cactusfruit_crate',          ['label'] = 'Cactus Fruit Crate',       ['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'cactusfruit_crate.png',       ['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of cactus fruits ready for selling!'},	
	['tomato_crate']       		= {['name'] = 'tomato_crate',          		['label'] = 'Tomato Crate',       		['weight'] = 2500,       ['type'] = 'item',      ['image'] = 'tomato_crate.png',       		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of tomatoes ready for selling!'},	
	['apple_crate']             = {['name'] = 'apple_crate',                ['label'] = 'Apple Crate',              ['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'apple_crate.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of apples ready for selling!'},	
	['orange_crate']            = {['name'] = 'orange_crate',               ['label'] = 'Orange Crate',             ['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'orange_crate.png',        	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of oranges ready for selling!'},	
	['lemon_crate']             = {['name'] = 'lemon_crate',                ['label'] = 'Lemon Crate',              ['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'lemon_crate.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of lemons ready for selling!'},	
	['lime_crate']             	= {['name'] = 'lime_crate',                	['label'] = 'Lime Crate',              	['weight'] = 3500,       ['type'] = 'item',      ['image'] = 'lime_crate.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of limes ready for selling!'},	
	['strawberry_crate']        = {['name'] = 'strawberry_crate',           ['label'] = 'Strawberry Crate',         ['weight'] = 2500,       ['type'] = 'item',      ['image'] = 'strawberry_crate.png',        ['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of strawberries ready for selling!'},	
	['blueberry_crate']        	= {['name'] = 'blueberry_crate',           	['label'] = 'Blueberry Crate',         	['weight'] = 2500,       ['type'] = 'item',      ['image'] = 'blueberry_crate.png',        	['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of blueberries ready for selling!'},
	['milk_crate']        		= {['name'] = 'milk_crate',           		['label'] = 'Milk Crate',         		['weight'] = 5500,       ['type'] = 'item',      ['image'] = 'milk_crate.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of milk bottles ready for selling!'},	
	['egg_crate']        		= {['name'] = 'egg_crate',           		['label'] = 'Egg Crate',         		['weight'] = 2500,       ['type'] = 'item',      ['image'] = 'egg_crate.png',        		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of eggs ready for selling!'},
	['pineapple_crate']            = {['name'] = 'pineapple_crate',               ['label'] = 'Pineapple Crate',             ['weight'] = 2500,       ['type'] = 'item',      ['image'] = 'pineapple_crate.png',            ['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A crate of pineapples ready for selling!'},
	
	-- Drugs
	['magic_mushroom']          = {['name'] = 'magic_mushroom',             ['label'] = 'Magic Mushroom',           ['weight'] = 20,       	 ['type'] = 'item',      ['image'] = 'magic_mushroom.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of magic mushrooms!'},	
	['peyote_button']          	= {['name'] = 'peyote_button',             	['label'] = 'Peyote Button',           	['weight'] = 20,       	 ['type'] = 'item',      ['image'] = 'peyote_button.png',        	['unique'] = false,     ['useable'] = true,    	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A handful of peyote buttons!'},	
	--<!>-- BOII FARMING --<!>--


### PREVIEW ###
https://www.youtube.com/watch?v=BlDeQWGPzrM

### SUPPORT ###
https://discord.gg/MUckUyS5Kq
