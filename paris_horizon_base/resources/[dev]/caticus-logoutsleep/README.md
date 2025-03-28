# Caticus LogoutSleep
A FiveM script that creates a sleeping ped when players log out, allowing for interaction and robbery.

## Features
- Creates a sleeping ped when players disconnect
- Maintains player appearance and clothing
- Allows carrying sleeping players
- Includes robbery system for sleeping players
- Syncs with player inventory
- Debug mode for troubleshooting

## Dependencies (edit the script to suit your server - its the reason I left it open source and free!)
### Required
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- An inventory system (one of the following):
  - [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
  - [ox_inventory](https://github.com/overextended/ox_inventory)
  - Or any other inventory system with minor code adjustments

### Recommended
- [qb-clothing](https://github.com/qbcore-framework/qb-clothing) or similar clothing system
  - Without a clothing system, sleeping peds will use the basic GTA model appearance
  - Compatible with other clothing systems that store appearance data in the `playerskins` database table
  - The script checks for `model` and `skin` data in the `playerskins` table

## Installation
1. Ensure you have all required dependencies installed
2. Place the `caticus-logoutsleep` folder in your resources directory
3. Make sure script is started via server.cfg
4. Configure the settings in `config.lua` to your liking

## Configuration
See `config.lua` for all available configuration options including:
- Animation settings
- Position offsets
- Inventory limits
- Robbery settings
- Debug mode

## Support
For support, please visit www.5Mservers.com