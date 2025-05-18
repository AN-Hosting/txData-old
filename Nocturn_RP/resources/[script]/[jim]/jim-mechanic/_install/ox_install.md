Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/kA6rGzwtrX

-------------------------------------------------------------------------------------------------

# OX Installation

-------------------------------------------------------------------------------------------------

# Dependencies

 - Jim_Bridge - https://github.com/jimathy/jim_bridge
   - This script is a requirement of jim-mechanic to function and bridge it between frameworks
 - Jim-Payments - https://github.com/jimathy/jim-payments [OPTIONAL]
   - This script is designed for charging customs and sending money to the society accounts
 - Jim-JobGarage - https://github.com/jimathy/jim-jobgarage [OPTIONAL]
   - This script is for creating temporary vehicles for job roles

-------------------------------------------------------------------------------------------------

Full Credit to wildbrick142 for the inclusion of the Chameleon Paints Mod

# INSTALLATION

## Ensure List
GO TO YOUR `server.cfg`

## Resources
start chat
start sessionmanager
start pe-basicloading
start bob74_ipl
start pma-voice
start oxmysql
start ox_lib
start ox_core
start ox_target
start illenium-appearance
start ox_inventory
ensure [standalone] # Place `jim_bridge` here
# Extra Jim Stuff
ensure [jimextras]  # Palce `jim-consumables / jim-jobgarage / jim-djbooth` here
ensure [jim] -- Place all other jim scripts here
# Extra Other Scripts Here

-------------------------------------------------------------------------------------------------

# Item installation
- There are two image folders, `images_alt` contains tiered images with their rank included

- Add the chosen images to your inventory folder eg. `ox_inventory > web > images`

- Add the lines from `ox_items.lua` to your `ox_inventory > data > items.lua`

-------------------------------------------------------------------------------------------------

## NOS + Odometer
There are expanded features included in this scripts with SQL

The script will auto inject the sql data into the correct place, if it doesn't import it manually.

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

The `status` column adds the ability to save vehicle damages

-------------------------------------------------------------------------------------------------

# Extra Damages and Upgrades

Extra Damages and their upgrades can be enabled/disabled in the config with `Config.Repairs.ExtraDamages = true`

The extra damages added by this script are shown as `Oil Level`, `Axle Shaft`, `Spark Plugs`, `Car Battery`and `Fuel Tank`.

These are repaired with the items (through the mechanic_tools repair item)
`newoil` - Fixes `Oil Level`
`sparkplugs` - Fixes `Spark Plugs`
`carbattery` - Fixes `Car Battery`
`axleparts` - Fixes `Axle Shaft`
`steel` - Fixes `Fuel Tank`
These are changeable through the config.

These effects are shown when they are damaged by driving
`Oil Level` damage will "Overheat" the vehicle and slowly damage the engine
`Axle Shaft` damage will affect the steering of the vehicle
`Spark Plugs` damage will make the vehicle stall
`Car Battery` damage will make the vehicle stall
`Fuel Tank` damage will cause fuel to drain faster

-------------------------------------------------------------------------------------------------

# Harness/Seatbelts

- If using QBCore follow qb_install
- If using ESX follow esx_install
- If using QBOX follow qbox_install

-------------------------------------------------------------------------------------------------


## Updating core events

If using `ox_lib`:
- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`

If using just `qb-core`:
- Replace the `QBCore.Functions.GetVehicleProperties` and `QBCore.Functions.SetVehicleProperties` in `qb-core > client > functions.lua` with the ones from `properties_qb.lua`
```