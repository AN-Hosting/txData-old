-- Correction de la structure de la table mdt_recent_activity
ALTER TABLE mdt_recent_activity MODIFY type VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_recent_activity MODIFY category VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE mdt_recent_activity MODIFY activityid VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 