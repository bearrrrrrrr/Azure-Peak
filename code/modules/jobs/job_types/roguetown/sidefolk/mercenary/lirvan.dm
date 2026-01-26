/datum/advclass/mercenary/lirvanmerc
	name = "Lirvan Tithebound"
	tutorial = "Contrary to the name, you're not indebted. Far from it. Lirvas is well-known for its economically aggressive brand of Matthiosanism, and the Tithebound are no exception to this opportunistic mammon-making. With tough scales reinforced by Matthiosan rituo, and solid armor, stand 'gainst the tide, and turn thyne WEALTH to POWER."
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
	cmode_music = 'sound/music/combat_matthios.ogg'

	subclass_stats = list(
		STATKEY_STR = 1, //poopy adv-tier stats, the majority of it will be via selfbuff
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_WIL = 1,
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

	wrists = /obj/item/clothing/wrists/roguetown/bracers/jackchain
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor //this kind of doesnt make sense but otherwise they'd start with like 10000 dollars total so
	neck = /obj/item/clothing/neck/roguetown/fencerguard
	shirt = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas
	head = /obj/item/clothing/head/roguetown/helmet/otavan
	armor = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas
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
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/lirvan_tithe)


/*                              ,---.
,--.  ,--.        ,--.  ,--.  |   |
|  '--'  | ,--,--.|  |,-'  '-.|  .'
|  .--.  |' ,-.  ||  |'-.  .-'|  |
|  |  |  |\ '-'  ||  |  |  |  `--'
`--'  `--' `--`--'`--'  `--'  .--.
                              '--'
shitcode stuff below this point; first, their regenerating skin which gives them a buff when broken, which works fine.
Second, a self-buff spell that buffs them depending on their total wealth including item sellvalue. I would have liked this to ideally been just a thing they got passively, but I can't fucking code, so... */

/obj/item/clothing/neck/roguetown/gorget/steel/gold
	name = "gold-plated gorget"
	desc = "A series of steel plates designed to protect the neck, traditionally worn atop a jacket or cuirass. It bares a mammon-sized divet along its right flank; the certification of its 'proofedness' against a longbow's strike. This one is covered in a thin layer of gold."
	color = "#f9a602"


/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas
	name = "hardened scales"
	repairmsg_begin = "My scales harden and begin mending."
	repairmsg_continue = "Golden light seeps 'tween myne mending scales."
	repairmsg_stop = "The onslaught stops my scales' regeneration!"
	repairmsg_end = "My scales are as strong once more!"

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas/Destroy() //this shouldn't happen, but just in case.....though maybe it'd be more sovl if it didn't...?
	remove_broken_scales_buff()
	return ..()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armor_penetration)
	. = ..()
	if(obj_integrity <= (initial(obj_integrity) * (0.11))) //UNBELIEVABLY SHIT CODE
		apply_broken_scales_buff()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas/armour_regen() //i...hope this works??
	remove_broken_scales_buff()
	return ..()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas/proc/apply_broken_scales_buff()
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/H = loc
	if(!H.has_status_effect(/datum/status_effect/buff/lirvan_broken_scales))
		H.apply_status_effect(/datum/status_effect/buff/lirvan_broken_scales)

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/lirvas/proc/remove_broken_scales_buff()
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/H = loc
	if(H.has_status_effect(/datum/status_effect/buff/lirvan_broken_scales))
		H.remove_status_effect(/datum/status_effect/buff/lirvan_broken_scales)


#define LIRVAN_BLING_FILTER "lirvan_titheaura"

/proc/get_moni_value(atom/movable/movable)
	var/wealth = 0
	if(istype(movable, /obj/item/roguecoin))
		var/obj/item/roguecoin/coin = movable
		wealth += coin.quantity * coin.sellprice
	else if(istype(movable, /obj/item))
		var/obj/item/item = movable
		if(item.sellprice)
			wealth += item.sellprice
	for(var/atom/movable/content in movable.contents)
		wealth += get_moni_value(content)
	return wealth

/obj/effect/proc_holder/spell/self/lirvan_tithe
	name = "Mammon's Bulwark"
	desc = "Invoke Lirvan rites to draw strength from the wealth you carry."
	antimagic_allowed = TRUE
	clothes_req = FALSE
	recharge_time = 3 MINUTES
	invocations = list("'s scales harden and glow softly!")
	invocation_type = "emote"

/obj/effect/proc_holder/spell/self/lirvan_tithe/cast(mob/living/user)
	if(!ishuman(user))
		return FALSE
	user.apply_status_effect(/datum/status_effect/buff/lirvan_tithe)
	return TRUE

/atom/movable/screen/alert/status_effect/buff/lirvan_tithe
	name = "Mammon's Bulwark"
	desc = "Briefly convert WEALTH to POWER, gaining stats based off of the total value of mammon, equipment, and jewelry on me. More POWER at 100, 200, 300, and 600 mammon."
	icon_state = "buff"

/datum/status_effect/buff/lirvan_tithe
	id = "lirvan_tithe"
	alert_type = /atom/movable/screen/alert/status_effect/buff/lirvan_tithe
	status_type = STATUS_EFFECT_REFRESH
	duration = 2 MINUTES
	var/wealth_value = 0
	var/outline_colour = "#f5d96c"

/datum/status_effect/buff/lirvan_tithe/on_apply()
	update_effects()
	. = ..()
	if(.)
		var/filter = owner.get_filter(LIRVAN_BLING_FILTER)
		if(!filter)
			owner.add_filter(LIRVAN_BLING_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 120, "size" = 1))
		to_chat(owner, span_notice("WEALTH answers my call. Every single one of my [src.wealth_value] pieces of it."))

/datum/status_effect/buff/lirvan_tithe/on_remove()
	. = ..()
	owner.remove_filter(LIRVAN_BLING_FILTER)
	to_chat(owner, span_warning("POWER fades."))

/datum/status_effect/buff/lirvan_tithe/proc/update_effects()
	wealth_value = get_moni_value(owner)
	if(wealth_value < 100)
		effectedstats = list(STATKEY_CON = 1)
	else if(wealth_value < 200)
		effectedstats = list(STATKEY_STR = 1, STATKEY_CON = 1)
	else if(wealth_value < 300)
		effectedstats = list(STATKEY_STR = 2, STATKEY_CON = 1, STATKEY_WIL = 1)
	else if(wealth_value < 600)
		effectedstats = list(STATKEY_STR = 2, STATKEY_CON = 2, STATKEY_WIL = 1)
	else
		effectedstats = list(STATKEY_STR = 3, STATKEY_CON = 2, STATKEY_WIL = 2)