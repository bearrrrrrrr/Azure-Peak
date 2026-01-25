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

/datum/outfit/job/roguetown/mercenary/lirvanmerc/pre_equip(mob/living/carbon/human/H)
	..()

	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	neck = /obj/item/clothing/neck/roguetown/fencerguard
	shirt = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas
	head = /obj/item/clothing/head/roguetown/helmet/otavan
	armor = /obj/item/clothing/suit/roguetown/armor/plate/otavan
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	shoes = /obj/item/clothing/shoes/roguetown/boots/otavan
	gloves = /obj/item/clothing/gloves/roguetown/otavan
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower/metal
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/flashlight/flare/torch = 1,
		)

	H.merctype = 16 //literally no idea what this does



/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas
	name = "hardened scales"
	repairmsg_begin = "My scales harden and begin mending."
	repairmsg_continue = "Golden light seeps 'tween myne mending scales."
	repairmsg_stop = "The onslaught stops my scales' regeneration!"
	repairmsg_end = "My scales are as strong and stiff as mammon once more!"

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas/Destroy() //this shouldn't happen, but just in case.....though maybe it'd be more sovl if it didn't...?
	remove_broken_scales_buff()
	return ..()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armor_penetration)
	var/was_intact = obj_integrity > 0
	. = ..()
	if(was_intact && obj_integrity <= 0)
		apply_broken_scales_buff()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas/armour_regen() //i...hope this works??
	remove_broken_scales_buff()
	return ..()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas/proc/apply_broken_scales_buff()
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/H = loc
	if(!H.has_status_effect(/datum/status_effect/buff/lirvan_broken_scales))
		H.apply_status_effect(/datum/status_effect/buff/lirvan_broken_scales)

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/lirvas/proc/remove_broken_scales_buff()
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/H = loc
	if(H.has_status_effect(/datum/status_effect/buff/lirvan_broken_scales))
		H.remove_status_effect(/datum/status_effect/buff/lirvan_broken_scales)
