//ok so these are slow, beefy dudes. these guys have 2 main gimmicks
//#1: regenerating skin armor flavored as scales; when broken you will get a +SPD -STR malus
//#2: get more powerful the more bling they have on. TBD whether or not

/datum/advclass/mercenary/lirvanmerc
	name = "Lirvan Tithebound"
	tutorial = "Contrary to the name, you're not indebted. Far from it. Lirvas is well-known for its economically aggressive brand of Matthiosanism, and the Tithebound are no exception to this opportunistic mammon-making. With tough scales reinforced by Matthiosan rituo, and heavy armor, stand 'gainst the tide, and turn thyne WEALTH to POWER."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/dracon,
		/datum/species/lizardfolk,
		/datum/species/kobold,
	) //no wildkin; i'd like to allow snek/liznerd wildkin, but i don't have a way of mechnaically enforcing that
	outfit = /datum/outfit/job/roguetown/mercenary/lirvanmerc
	class_select_category = CLASS_CAT_RACIAL
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_SEEPRICES, TRAIT_MEDIUMARMOR)

	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_INT = 1,
		STATKEY_CON = 4,
		STATKEY_WIL = 3,
		STATKEY_PER = 1,
		STATKEY_SPD = -2
	)
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/staves = SKILL_LEVEL_EXPERT //awww yeah
	)
	extra_context = "This subclass is race-limited to: Drakian, Zardman, and Kobold. This subclass locks you to Matthios-worship."