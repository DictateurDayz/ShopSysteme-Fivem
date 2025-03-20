Config = {}

--- Config Position

Config.textUI = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la supérette" -- Texte affiché en haut à droite de l'écran lorsqu'un joueur s'approche d'un magasin.

Config.Blips = {
    type = 59, -- Type de blip affiché sur la carte.
    scale = 0.8, -- Taille du blip.
    color = 12, -- Couleur du blip.
    name = "Epicérie"  -- Nom affiché sur la carte.
}

Config.MoneyType = "$" -- Symbole de la monnaie utilisée sur le serveur.

Config.Positon = {
    {
        pos = vector3(24.36308, -1346.311, 29.49702), -- Position du PNJ
        heading = 271.83261108398, -- Orientation du PNJ (direction dans laquelle il regarde).
        model = "g_m_y_famdnf_01", -- Modèle du PNJ.
    },
    {pos = vector3(-47.0944, -1758.823, 29.421),heading = 50.594272613525,model = "g_m_y_ballasout_01",},
    {pos = vector3(1134.042, -983.1162, 46.41585),heading = 278.00146484375,model = "g_m_y_azteca_01",},
    {pos = vector3(1165.044, -323.6239, 69.20514),heading = 103.3971786499, model = "mp_m_shopkeep_01",},
    {pos = vector3(372.8104, 328.0672, 103.5664),heading = 254.40423583984,model = "s_f_y_migrant_01",},
    {pos = vector3(-1486.561, -377.4709, 40.16339),heading = 141.92056274414,model = "s_m_o_busker_01",},
    {pos = vector3(-1221.368, -907.9769, 12.32635),heading = 32.69815826416,model = "g_f_y_vagos_01",},
    {pos = vector3(-705.9963, -914.5262, 19.21559),heading = 90.698265075684,model = "g_m_m_chigoon_01",},
    {pos = vector3(2555.604, 380.8791, 108.623),heading = 357.66351318359,model = "s_f_y_sweatshop_01",},
    {pos = vector3(2676.511, 3280.077, 55.24114),heading = 331.46298217773,model = "mp_m_shopkeep_01",},
    {pos = vector3(1697.285, 4923.363, 42.06367),heading = 329.44146728516,model = "a_m_m_hillbilly_01",},
    {pos = vector3(1959.207, 3741.413, 32.34374),heading = 296.40338134766,model = "ig_maude",},
    {pos = vector3(1391.987, 3606.142, 34.98093),heading = 199.36833190918,model = "a_m_m_hillbilly_02",},
    {pos = vector3(1165.253, 2710.959, 38.15771),heading = 180.92448425293,model = "a_m_o_genstreet_01",},
    {pos = vector3(549.3683, 2669.72, 42.1565),heading = 99.545852661133,model = "ig_old_man2",},
    {pos = vector3(-3243.949, 1000.148, 12.8307),heading = 352.75274658203,model = "ig_talcc",},
    {pos = vector3(-2966.178, 391.5708, 15.0433),heading = 90.680458068848,model = "ig_stretch",},
    {pos = vector3(-3040.514, 584.0455, 7.90893),heading = 22.773487091064,model = "u_m_m_griff_01",},
    {pos = vector3(1728.406, 6416.763, 35.03723),heading = 250.33319091797,model = "g_f_y_families_01",},
}

--- Config Menu 

Config.titlemenu = nil -- Titre du menu affiché dans la bannière.
Config.subtitle = "Supérette" -- Sous-titre du menu.
Config.TextureDictionary = "commonmenu" -- Nom du fichier YTD contenant les assets du menu.
Config.TextureName = "gradient_bgd" -- Nom de l’asset dans le fichier YTD.
Config.mainColor = "~r~" -- Couleur principale utilisée dans les séparateurs.
Config.RightLabel = "→→→" -- Texte affiché sur le côté droit des boutons.

--- Config Food SubMenu

Config.titleFoodMenu = "Nourritures" -- Titre du bouton.
Config.subtitleFoodMenu = "Nourritures" -- Sous-titre du menu.
Config.descriptionFoodMenu = nil -- Description affichée sous le bouton.

Config.Food = {
    {
        label = "Pain", -- Nom de l'item affiché dans le menu.
        name = "burger", -- Nom de l'item dans l'inventaire.
        price = 8 -- Prix de l'item.
    },
}


--- Config Drink SubMenu

Config.titleDrinkMenu = "Boissons" -- Titre du bouton.
Config.subtitleDrinkMenu = "Boissons" -- Sous-titre du menu.
Config.descriptionDrinkMenu = nil -- Description affichée sous le bouton.

Config.Drink = {
    {label = "Eaux", name = "water", price = 8},
    {label = "Sprite", name = "sprunk", price = 10},
}


--- Config Other SubMenu

Config.titleOtherMenu = "Autres" -- Titre du bouton.
Config.subtitleOtherMenu = "Autres"  -- Sous-titre du menu.
Config.descriptionOtherMenu = nil -- Description affichée sous le bouton.

Config.Other = {
    {label = "Téléphone", name = "phone", price = 1500},
    {label = "Radio", name = "radio", price = 750},
}

--- Config Payment SubMenu

Config.titlePaymentMenu = "Paiment" -- Titre du bouton.
Config.subtitlePaymentMenu = "Paiment" -- Sous-titre du menu.



