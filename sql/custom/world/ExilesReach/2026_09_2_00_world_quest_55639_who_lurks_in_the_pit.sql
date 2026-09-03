-- ============================================================================
-- COMPLETE DATABASE BUNDLE FOR QUEST 55639: "WHO LURKS IN THE PIT"
-- ============================================================================
SET NAMES utf8mb4;
-- 0. CLEANUP STATIC WORLD SPAWNS
DELETE FROM `creature` WHERE `id` IN (156900, 156902);

-- 1. CREATURE TEMPLATES
DELETE FROM `creature_template` WHERE `entry` IN (156900, 156902, 156929, 160964);

INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES 
(156900, 0, 0, 'Hrun the Exiled', '', NULL, NULL, NULL, 0, 0, 14, 0, 1, 1.35714, 1, 0, 0, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 6, 0, '', 0, 1, 0, 875, 0, 0, 1, 0, 0, 'npc_hrun_q55639', NULL, 56313),
(156902, 0, 0, 'Ralia Dreamchaser', '', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1.14286, 1, 0, 0, 0, 2000, 1, 1, 8, 0, 0, 0, 0, 0, 7, 0, '', 0, 1, 0, 0, 0, 0, 1, 0, 0, 'npc_ralia_prisoner', 'ralia_dreamchaser_prisoner', 56313),
(156929, 0, 0, 'Ralia Dreamchaser', '', NULL, NULL, 'vehichlecursor', 0, 0, 2142, 33554432, 1, 1.14286, 1, 0, 0, 0, 2000, 1, 1, 8, 0, 2048, 67108864, 5, 0, 1, 6832, '', 0, 1, 0, 206, 0, 0, 1, 0, 0, 'npc_ralia_vehicle_q55639', NULL, 56313),
(160964, 0, 0, 'Freed Expedition Member', '', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1.14286, 1, 0, 0, 0, 2000, 1, 1, 1, 0, 0, 0, 0, 0, 7, 0, '', 0, 1, 0, 0, 0, 0, 1, 0, 0, 'npc_freed_expedition_member_q55639', NULL, 56313);

-- 2. QUEST TEMPLATE ADDON (Quest Script Registration)
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `BreadcrumbForQuestID`, `ProvidedItemCount`, `SpecialFlags`, `ScriptName`)
VALUES (55639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'q55639_who_lurks_in_the_pit')
ON DUPLICATE KEY UPDATE `ScriptName` = 'q55639_who_lurks_in_the_pit';

-- 3. QUEST METADATA & BUILD UPDATES
UPDATE `quest_template` SET `VerifiedBuild` = 56313 WHERE `ID` = 55639;
UPDATE `quest_details` SET `VerifiedBuild` = 56313 WHERE `ID` = 55639;
UPDATE `quest_offer_reward` SET `VerifiedBuild` = 56313 WHERE `ID` = 55639;

UPDATE `quest_poi` SET `VerifiedBuild` = 56313 WHERE (`QuestID` = 55639 AND `BlobIndex` = 0 AND `Idx1` = 4) 
    OR (`QuestID` = 55639 AND `BlobIndex` = 0 AND `Idx1` = 3) 
    OR (`QuestID` = 55639 AND `BlobIndex` = 0 AND `Idx1` = 2) 
    OR (`QuestID` = 55639 AND `BlobIndex` = 0 AND `Idx1` = 1) 
    OR (`QuestID` = 55639 AND `BlobIndex` = 0 AND `Idx1` = 0);

UPDATE `quest_poi_points` SET `VerifiedBuild` = 56313 WHERE (`QuestID` = 55639 AND `Idx1` = 4 AND `Idx2` = 0) 
    OR (`QuestID` = 55639 AND `Idx1` = 3 AND `Idx2` = 0) 
    OR (`QuestID` = 55639 AND `Idx1` = 2 AND `Idx2` = 0) 
    OR (`QuestID` = 55639 AND `Idx1` = 1 AND `Idx2` = 4) 
    OR (`QuestID` = 55639 AND `Idx1` = 1 AND `Idx2` = 3) 
    OR (`QuestID` = 55639 AND `Idx1` = 1 AND `Idx2` = 2) 
    OR (`QuestID` = 55639 AND `Idx1` = 1 AND `Idx2` = 1) 
    OR (`QuestID` = 55639 AND `Idx1` = 1 AND `Idx2` = 0) 
    OR (`QuestID` = 55639 AND `Idx1` = 0 AND `Idx2` = 0);

-- 4. QUEST STARTER & ENDER RELATIONS
DELETE FROM `creature_queststarter` WHERE `id` = 156803 AND `quest` = 55639;
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (156803, 55639, 56313);

DELETE FROM `creature_questender` WHERE `id` = 156807 AND `quest` = 55639;
INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) VALUES (156807, 55639, 56313);

-- 5. CREATURE TEXTS (Mapped to correct world entry IDs: 156900, 156891, 156902, 156803, 156929, 160964)
DELETE FROM `creature_text` WHERE `CreatureID` IN (156900, 156891, 156902, 156803, 156929, 160964);

INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `SoundPlayType`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(156900, 0, 0, 'I will harvest your life force... and then those who sealed me in here will burn.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Hrun - Agro'),
(156900, 1, 0, 'If... I die... so... do you!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Hrun - Death'),
(156900, 2, 0, 'You will be kindling for the flame!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Hrun - Say to Prisoner / Objective Reached');
(156891, 2, 0, 'The survivors are counting on ya!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Bjorn - Accept Quest'),
(156891, 3, 0, 'You did a good job saving those people and dealing with those spiders.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Bjorn - Post Escape 1'),
(156891, 4, 0, 'Yeah…well, I guess ye could see it that way.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Bjorn - Post Escape 2'),
(156891, 5, 0, 'Bah! You were just telling me how much you hate spiders.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Bjorn - Post Escape 3'),
(156902, 0, 0, 'Is anyone there? Help! Elune, guide them to me!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Ralia Prisoner - Objective Reached'),
(156902, 1, 0, 'You saved my life! Allow me to return the favor! Hop on!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Ralia Prisoner - Freed / Thank You'),
(156902, 2, 0, 'Those spiders were victims too. They just lost their home.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Ralia - Post Escape Spiders'),
(156803, 0, 0, 'Rescue anyone you can!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Alaria - Accept Quest'),
(156803, 1, 0, 'By the Light you’re alive!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Alaria - Post Escape 1'),
(156803, 2, 0, 'You should have known better than to say that to a druid.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Alaria - Post Escape 2'),
(156803, 3, 0, 'The Light shines on all creatures. That does not mean I have to like them.', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Alaria - Post Escape 3'),
(156929, 0, 0, 'Elune, please shield us from harm!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Ralia Vehicle - Escape Start'),
(160964, 0, 0, 'I though I was dead! Please, you have to rescue Ralia Dreamchaser deeper below!', 12, 0, 100, 0, 0, 0, 0, 0, 0, 'Trapped Guard - Freed');

-- 6. GAMEOBJECT STATE CONFIGURATION (Thick Cocoon - Entry 339568)
UPDATE `gameobject` SET `state` = 1 WHERE `id` = 339568;

-- 7. VEHICLE SPELLCLICK CONFIGURATION
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 156929;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) 
VALUES (156929, 43671, 1, 0);

-- 8. VERIFICATION SELECTS
SELECT entry, name, ScriptName FROM `creature_template` WHERE `entry` IN (156900, 156891, 156902, 156803, 156929, 160964);
SELECT ID, ScriptName FROM `quest_template_addon` WHERE `ID` = 55639;
SELECT CreatureID, GroupID, ID, Text, comment FROM `creature_text` WHERE `CreatureID` IN (156900, 156891, 156902, 156803, 156929, 160964) ORDER BY CreatureID, GroupID;
SELECT guid, id, state FROM `gameobject` WHERE `id` = 339568;