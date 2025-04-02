-- Vérification et correction des profils MDT pour les officiers de police
INSERT INTO mdt_profiles (citizenid, callsign, lastActive)
SELECT p.citizenid, '', NOW()
FROM players p
WHERE p.job = 'police'
AND NOT EXISTS (
    SELECT 1 FROM mdt_profiles mp WHERE mp.citizenid = p.citizenid
);

-- Mise à jour du statut actif pour tous les officiers de police
UPDATE mdt_profiles mp
JOIN players p ON p.citizenid = mp.citizenid
SET mp.lastActive = NOW()
WHERE p.job = 'police'; 