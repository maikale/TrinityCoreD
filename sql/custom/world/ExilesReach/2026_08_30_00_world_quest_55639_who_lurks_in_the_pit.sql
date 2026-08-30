-- ============================================================
-- Who Lurks in the Pit (55639) - Part 1
-- Exile's Reach
-- ============================================================

UPDATE `quest_offer_reward`
SET `VerifiedBuild` = 56313
WHERE `ID` = 55639;

UPDATE `quest_poi`
SET `VerifiedBuild` = 56313
WHERE `QuestID` = 55639
  AND `BlobIndex` = 0
  AND `Idx1` IN (0, 1, 2, 3, 4);

UPDATE `quest_poi_points`
SET `VerifiedBuild` = 56313
WHERE `QuestID` = 55639
  AND (
        (`Idx1` = 4 AND `Idx2` = 0)
     OR (`Idx1` = 3 AND `Idx2` = 0)
     OR (`Idx1` = 2 AND `Idx2` = 0)
     OR (`Idx1` = 1 AND `Idx2` IN (0, 1, 2, 3, 4))
     OR (`Idx1` = 0 AND `Idx2` = 0)
  );

UPDATE `quest_details`
SET `VerifiedBuild` = 56313
WHERE `ID` = 55639;

DELETE FROM `creature_queststarter`
WHERE `id` = 156803
  AND `quest` = 55639;

INSERT INTO `creature_queststarter`
    (`id`, `quest`, `VerifiedBuild`)
VALUES
    (156803, 55639, 56313);

DELETE FROM `creature_questender`
WHERE `id` = 156807
  AND `quest` = 55639;

INSERT INTO `creature_questender`
    (`id`, `quest`, `VerifiedBuild`)
VALUES
    (156807, 55639, 56313);

UPDATE `quest_template`
SET `VerifiedBuild` = 56313
WHERE `ID` = 55639;

-- Enable the 5 existing Thick Cocoon spawns
UPDATE `gameobject`
SET `state` = 1
WHERE `guid` BETWEEN 8000022 AND 8000026
  AND `id` = 339568;