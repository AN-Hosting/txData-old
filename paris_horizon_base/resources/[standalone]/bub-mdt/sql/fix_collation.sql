-- Correction de la collation pour toutes les tables MDT
ALTER TABLE players MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_recent_activity MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_incidents_criminals MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_incidents_officers MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_reports_officers MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_reports_citizens MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_announcements MODIFY creator VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_profiles MODIFY citizenid VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 