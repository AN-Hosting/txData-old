```
 ██████╗ ██████╗       ██████╗██████╗  █████╗ ███████╗████████╗██╗███╗   ██╗ ██████╗
██╔═══██╗██╔══██╗     ██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗  ██║██╔════╝
██║   ██║██████╔╝     ██║     ██████╔╝███████║█████╗     ██║   ██║██╔██╗ ██║██║  ███╗
██║▄▄ ██║██╔══██╗     ██║     ██╔══██╗██╔══██║██╔══╝     ██║   ██║██║╚██╗██║██║   ██║
╚██████╔╝██████╔╝     ╚██████╗██║  ██║██║  ██║██║        ██║   ██║██║ ╚████║╚██████╔╝
 ╚══▀▀═╝ ╚═════╝       ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝
```

### Développé par BobyBis
Un système de craft avancé pour QB-Core avec support des jobs, des niveaux d'XP, et des zones de craft personnalisables.

## 📋 Configuration

### 1. Configuration Principale (`shared/config.lua`)

```lua
Config = {
    EnableSkillCheck = false,  -- Activer/désactiver le mini-jeu de craft
    ImageBasePath = "nui://qs-inventory/html/images/",  -- Chemin des images d'items
    
    Zones = {
        debugPoly = false,     -- Afficher les polygones de debug
        size = {
            length = 1.0,      -- Longueur des boxzones
            width = 2.0,       -- Largeur des boxzones
            verticalOffset = 1.0  -- Offset vertical
        },
        interaction = {
            distance = 3.0     -- Distance d'interaction
        }
    }
}
```

### 2. Création d'une Table de Craft

Les tables de craft sont définies dans des fichiers séparés dans le dossier `shared/configs/`. Exemple :

```lua
return {
    {
        name = "Nom de la Zone",        -- Nom affiché dans le menu
        type = "type_unique",           -- Identifiant unique pour la zone
        coords = vector4(x, y, z, h),   -- Position (x, y, z) et heading (h)
        useProps = false,               -- true pour utiliser un prop, false pour une boxzone
        prop = "prop_name",             -- Nom du prop (si useProps = true)
        jobs = {                        -- Jobs autorisés (optionnel)
            ['jobname'] = 0             -- 0 = tous les grades, 1+ = grade minimum requis
        },
        xpType = "craftingxp",         -- Type d'XP (optionnel)
        recipes = {                     -- Liste des recettes
            {
                item = "item_id",       -- ID de l'item à crafter
                label = "Nom Item",     -- Nom affiché (optionnel)
                xpRequired = 0,         -- XP requise pour crafter
                xpGain = 1,            -- XP gagnée en craftant (optionnel)
                requiredItems = {       -- Items requis
                    { item = "item_id", amount = 1 }
                }
            }
        }
    }
}
```

### 3. Ajout d'une Nouvelle Configuration

1. Créez un nouveau fichier dans `shared/configs/` (ex: `moncraft.lua`)
2. Ajoutez le nom du fichier (sans .lua) dans la liste `configFiles` dans `config.lua`
3. Suivez le format de configuration ci-dessus

### 4. Types de Zones de Craft

#### BoxZone (sans prop)
```lua
useProps = false,
coords = vector4(x, y, z, h)
```

#### Prop Physique
```lua
useProps = true,
prop = "nom_du_prop",  -- ou hash du prop
coords = vector4(x, y, z, h)
```

### 5. Système d'XP (Optionnel)

Pour utiliser le système d'XP :
1. Définissez `xpType` dans la table de craft
2. Ajoutez `xpRequired` aux recettes
3. Optionnel : Ajoutez `xpGain` pour donner de l'XP en craftant

## 🔧 Dépendances

- qb-core
- qb-target
- qb-menu
- qb-input
- qb-inventory

## ⚠️ Points Importants

1. Assurez-vous que tous les items existent dans `QBCore.Shared.Items`
2. Les coordonnées doivent être précises pour éviter les chevauchements
3. Les props doivent être chargés dans le jeu
4. Les boxzones sont plus légères en performance que les props

## 🐛 Résolution des Problèmes

1. Si les items ne s'affichent pas : Vérifiez qu'ils existent dans `QBCore.Shared.Items`
2. Si les zones ne s'affichent pas : Activez `debugPoly` pour voir les zones
3. Si les props ne spawned pas : Vérifiez que le nom/hash du prop est correct
4. Si l'XP ne fonctionne pas : Vérifiez que le type d'XP existe dans les metadata du joueur

# License

    QBCore Framework
    Copyright (C) 2024 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>