------------------------------------------------------------------------------
--	FILE:	 new_bbg_policies.sql
--	AUTHOR:  iElden, D. / Jack The Narrator
--	PURPOSE: Database modifications by new BBG
------------------------------------------------------------------------------
--==============================================================================================
--******				P O L I C I E S					  ******
--==============================================================================================

-- Existing Policies Adjustments

-- DISICPLINE
-- Buff Discipline +5 -> +10
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='DISCIPLINE_BARBARIANCOMBAT' AND Name='Amount';

-- LIMES
-- Limes doesn't Obsolete
DELETE FROM ObsoletePolicies WHERE PolicyType='POLICY_LIMES';

-- Nerf Limes +100 -> +50 to production / voted against ? BASE Game
--UPDATE ModifierArguments SET Value='50' WHERE ModifierId='LIMES_TSIKHEPRODUCTION' AND Name='Amount';
--UPDATE ModifierArguments SET Value='50' WHERE ModifierId='LIMES_CASTLEPRODUCTION' AND Name='Amount';
--UPDATE ModifierArguments SET Value='50' WHERE ModifierId='LIMES_WALLSPRODUCTION' AND Name='Amount';
--UPDATE ModifierArguments SET Value='50' WHERE ModifierId='LIMES_STARFORTPRODUCTION' AND Name='Amount';

-- New Policies

INSERT OR IGNORE INTO Types 
	(Type, Kind)
	VALUES
	('POLICY_SIEGE', 'KIND_POLICY'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'KIND_POLICY'),
	('POLICY_TRENCH_WARFARE', 'KIND_POLICY');

INSERT OR IGNORE INTO Policies 
	(PolicyType                  , Name	, Description , PrereqCivic, GovernmentSlotType)
	VALUES
	('POLICY_SIEGE', 'LOC_POLICY_SIEGE_NAME' , 'LOC_POLICY_SIEGE_DESCRIPTION' , 'CIVIC_MILITARY_TRAINING' , 'SLOT_MILITARY'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'LOC_POLICY_HARD_SHELL_EXPLOSIVES_NAME' , 'LOC_POLICY_HARD_SHELL_EXPLOSIVES_DESCRIPTION' , 'CIVIC_MEDIEVAL_FAIRES' , 'SLOT_MILITARY'),
	('POLICY_TRENCH_WARFARE', 'LOC_POLICY_TRENCH_WARFARE_NAME' , 'LOC_POLICY_TRENCH_WARFARE_DESCRIPTION' , 'CIVIC_SCORCHED_EARTH' , 'SLOT_MILITARY');
	
INSERT OR IGNORE INTO ObsoletePolicies
	(PolicyType, ObsoletePolicy)
	VALUES
	('POLICY_SIEGE', 'POLICY_HARD_SHELL_EXPLOSIVES'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'POLICY_TRENCH_WARFARE');
	
INSERT OR IGNORE INTO PolicyModifiers
	(PolicyType, ModifierId)
	VALUES
	('POLICY_SIEGE', 'SIEGE_ANCIENT_SIEGE_PRODUCTION'),
	('POLICY_SIEGE', 'SIEGE_CLASSICAL_SIEGE_PRODUCTION'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'HARD_SHELL_ANCIENT_SIEGE_PRODUCTION'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'HARD_SHELL_CLASSICAL_SIEGE_PRODUCTION'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'HARD_SHELL_MEDIEVAL_SIEGE_PRODUCTION'),
	('POLICY_HARD_SHELL_EXPLOSIVES', 'HARD_SHELL_RENAISSANCE_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_ANCIENT_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_CLASSICAL_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_MEDIEVAL_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_RENAISSANCE_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_INDUSTRIAL_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_MODERN_SIEGE_PRODUCTION'),
	('POLICY_TRENCH_WARFARE', 'TRENCH_WARFARE_ATOMIC_SIEGE_PRODUCTION');
	
INSERT OR IGNORE INTO Modifiers
	(ModifierId                 , ModifierType)
	VALUES
	('SIEGE_ANCIENT_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('SIEGE_CLASSICAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),	
	('HARD_SHELL_ANCIENT_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('HARD_SHELL_CLASSICAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),	
	('HARD_SHELL_MEDIEVAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('HARD_SHELL_RENAISSANCE_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),	
	('TRENCH_WARFARE_ANCIENT_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('TRENCH_WARFARE_CLASSICAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),	
	('TRENCH_WARFARE_MEDIEVAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('TRENCH_WARFARE_RENAISSANCE_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('TRENCH_WARFARE_INDUSTRIAL_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('TRENCH_WARFARE_MODERN_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'),		
	('TRENCH_WARFARE_ATOMIC_SIEGE_PRODUCTION'         , 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION');		
	
INSERT OR IGNORE INTO ModifierArguments
	(ModifierId                 , Name, Value, Extra)
	VALUES
	('SIEGE_ANCIENT_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('SIEGE_ANCIENT_SIEGE_PRODUCTION'         , 'EraType', 'ERA_ANCIENT', -1 ),
	('SIEGE_ANCIENT_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('SIEGE_CLASSICAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('SIEGE_CLASSICAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_CLASSICAL', -1 ),
	('SIEGE_CLASSICAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('HARD_SHELL_ANCIENT_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('HARD_SHELL_ANCIENT_SIEGE_PRODUCTION'         , 'EraType', 'ERA_ANCIENT', -1 ),
	('HARD_SHELL_ANCIENT_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('HARD_SHELL_CLASSICAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('HARD_SHELL_CLASSICAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_CLASSICAL', -1 ),
	('HARD_SHELL_CLASSICAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('HARD_SHELL_MEDIEVAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('HARD_SHELL_MEDIEVAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_MEDIEVAL', -1 ),
	('HARD_SHELL_MEDIEVAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('HARD_SHELL_RENAISSANCE_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('HARD_SHELL_RENAISSANCE_SIEGE_PRODUCTION'         , 'EraType', 'ERA_RENAISSANCE', -1 ),
	('HARD_SHELL_RENAISSANCE_SIEGE_PRODUCTION'         , 'Amount', 50, -1),	
	('TRENCH_WARFARE_ANCIENT_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_ANCIENT_SIEGE_PRODUCTION'         , 'EraType', 'ERA_ANCIENT', -1 ),
	('TRENCH_WARFARE_ANCIENT_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('TRENCH_WARFARE_CLASSICAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_CLASSICAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_CLASSICAL', -1 ),
	('TRENCH_WARFARE_CLASSICAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('TRENCH_WARFARE_MEDIEVAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_MEDIEVAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_MEDIEVAL', -1 ),
	('TRENCH_WARFARE_MEDIEVAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('TRENCH_WARFARE_RENAISSANCE_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_RENAISSANCE_SIEGE_PRODUCTION'         , 'EraType', 'ERA_RENAISSANCE', -1 ),
	('TRENCH_WARFARE_RENAISSANCE_SIEGE_PRODUCTION'         , 'Amount', 50, -1),		
	('TRENCH_WARFARE_INDUSTRIAL_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_INDUSTRIAL_SIEGE_PRODUCTION'         , 'EraType', 'ERA_INDUSTRIAL', -1 ),
	('TRENCH_WARFARE_INDUSTRIAL_SIEGE_PRODUCTION'         , 'Amount', 50, -1),
	('TRENCH_WARFARE_MODERN_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_MODERN_SIEGE_PRODUCTION'         , 'EraType', 'ERA_MODERN', -1 ),
	('TRENCH_WARFARE_MODERN_SIEGE_PRODUCTION'         , 'Amount', 50, -1),	
	('TRENCH_WARFARE_ATOMIC_SIEGE_PRODUCTION'         , 'UnitPromotionClass', 'PROMOTION_CLASS_SIEGE', -1 ),
	('TRENCH_WARFARE_ATOMIC_SIEGE_PRODUCTION'         , 'EraType', 'ERA_ATOMIC', -1 ),
	('TRENCH_WARFARE_ATOMIC_SIEGE_PRODUCTION'         , 'Amount', 50, -1);	