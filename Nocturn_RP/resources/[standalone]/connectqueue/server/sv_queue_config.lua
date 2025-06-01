Config = {}

-- La liste de priorité peut utiliser n'importe quel identifiant (steamid hex, steamid32, ip). L'entier = puissance de priorité par rapport aux autres joueurs
-- Beaucoup de sites de conversion de steamid sont cassés et donnent le mauvais steamid. J'utilise https://steamid.xyz/ sans problème.
-- Vous pouvez également donner la priorité via l'API, lisez les exemples/readme.
Config.Priority = {
    ["STEAM_0:1:0000####"] = 1,
    ["steam:110000######"] = 25,
    ["ip:127.0.0.0"] = 85
}

-- Exiger que les joueurs utilisent Steam
Config.RequireSteam = false

-- Serveur "whitelist" uniquement
Config.PriorityOnly = false

-- Désactive le hardcap, devrait rester à true
Config.DisableHardCap = true

-- Retirera les joueurs de la connexion s'ils ne se chargent pas dans : __ secondes ; Peut nécessiter d'augmenter cette valeur si vous avez beaucoup de téléchargements.
-- Je n'ai pas encore trouvé de moyen facile de déterminer s'ils sont toujours en train de se connecter et de télécharger du contenu ou s'ils sont bloqués sur l'écran de chargement.
-- Cela peut causer des erreurs de session provider si c'est trop bas car le joueur retiré peut toujours être en train de se connecter, et laissera passer la personne suivante...
-- même si le serveur est plein. 10 minutes devraient être suffisantes
Config.ConnectTimeOut = 600

-- Retirera les joueurs de la file s'ils ne reçoivent pas de message du serveur dans : __ secondes
Config.QueueTimeOut = 90

-- Donnera aux joueurs une priorité temporaire lorsqu'ils se déconnectent et lorsqu'ils commencent à se connecter
Config.EnableGrace = false

-- Quelle puissance de priorité le temps de grâce donnera
Config.GracePower = 5

-- Combien de temps dure le temps de grâce en secondes
Config.GraceTime = 480

Config.AntiSpam = false
Config.AntiSpamTimer = 30
Config.PleaseWait = "Veuillez patienter %f secondes. La connexion démarrera automatiquement !"

-- Au démarrage de la ressource, les joueurs peuvent rejoindre la file mais ne pourront pas se connecter pendant __ millisecondes
-- Cela permet à la file de se stabiliser et aux autres ressources de terminer leur initialisation
Config.JoinDelay = 30000

-- Affichera combien de personnes ont une priorité temporaire dans le message de connexion
Config.ShowTemp = false

-- Localisation simple
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Connexion en cours...",
    connecting = "\xE2\x8F\xB3Connexion...",
    idrr = "\xE2\x9D\x97[File] Erreur : Impossible de récupérer vos identifiants, essayez de redémarrer.",
    err = "\xE2\x9D\x97[File] Une erreur s'est produite",
    pos = "\xF0\x9F\x90\x8CVous êtes %d/%d dans la file \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[File] Erreur : Impossible de vous ajouter à la liste de connexion",
    timedout = "\xE2\x9D\x97[File] Erreur : Délai d'attente dépassé ?",
    wlonly = "\xE2\x9D\x97[File] Vous devez être whitelist pour rejoindre ce serveur",
    steam = "\xE2\x9D\x97[File] Erreur : Steam doit être en cours d'exécution"
}
