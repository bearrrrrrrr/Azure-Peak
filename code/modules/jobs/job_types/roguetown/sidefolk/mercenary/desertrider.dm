/datum/advclass/mercenary/desert_rider
	name = "Desert Rider Janissary"
	tutorial = "The Janissaries are the Empire's elite infantry units, wielding mace and shield. We do not break."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider
	class_select_category = CLASS_CAT_RANESHENI
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg' //GREATEST COMBAT TRACK IN THE GAME SO FAR BESIDES MAYBE MANIAC2.OGG
	subclass_languages = list(/datum/language/celestial)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_WIL = 2,
		STATKEY_SPD = 2,
		STATKEY_PER = -1
	)
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
	)


/datum/outfit/job/roguetown/mercenary/desert_rider/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/zeybek_momentum/janissary)
	to_chat(H, span_warning("The Janissaries are the Empire's elite infantry units, wielding mace and shield. We do not break."))
	head = /obj/item/clothing/head/roguetown/helmet/sallet/raneshen
	neck = /obj/item/clothing/neck/roguetown/bevor
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	gloves = /obj/item/clothing/gloves/roguetown/chain
	pants = /obj/item/clothing/under/roguetown/brigandinelegs
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/flashlight/flare/torch,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	var/weapons = list("Heavy Mace","Shamshir and Shield","Spear and Shield")
	if(H.mind)
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Heavy Mace")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
				backl = /obj/item/rogueweapon/mace/goden
			if("Shamshir and Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
				r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
				backl = /obj/item/rogueweapon/shield/tower/raneshen
			if("Spear and Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				r_hand = /obj/item/rogueweapon/spear
				backl = /obj/item/rogueweapon/shield/tower/raneshen

	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/sabre/shamshir

	H.merctype = 4

/datum/advclass/mercenary/desert_rider/zeybek
	name = "Desert Rider Zeybek"
	tutorial = "Ranesheni 'Blade Dancers' are famed and feared the world over. Their expertise in blades both long and short is well known."
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider_zeybek
	traits_applied = list(TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_WIL = 2,
		STATKEY_INT = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/shields = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/mercenary/desert_rider_zeybek/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/zeybek_momentum/zeybek)
	to_chat(H, span_warning("Ranesheni 'Blade Dancers' are famed and feared the world over. Their expertise in blades both long and short is well known."))
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
	neck = /obj/item/clothing/neck/roguetown/leather
	mask = /obj/item/clothing/mask/rogue/facemask/steel/paalloy
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	gloves = /obj/item/clothing/gloves/roguetown/angle
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/flashlight/flare/torch,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	var/weapons = list("Shamshirs and Javelin","Whips and Knives", "Recurve Bow")
	if(H.mind)
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Shamshirs and Javelin")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
				backl = /obj/item/quiver/javelin/iron
			if("Whips and Knives")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/rogueweapon/whip
				l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
				backl = /obj/item/rogueweapon/scabbard/sheath
			if("Recurve Bow")
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
				backl = /obj/item/quiver/arrows
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/sabre/shamshir

	H.merctype = 4


/datum/advclass/mercenary/desert_rider/almah
	name = "Desert Rider Almah"
	tutorial = "Almah are those skilled in both magyck and swordsmanship, but excelling in nothing."
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider_almah
	traits_applied = list(TRAIT_ARCYNE_T2, TRAIT_MAGEARMOR)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_WIL = 2,
		STATKEY_INT = 2,
		STATKEY_PER = -1
	)
	subclass_spellpoints = 15
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/mercenary/desert_rider_almah/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("Almah are those skilled in both magyck and swordsmanship, but excelling in nothing."))
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/repulse)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enchant_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/airblade)
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
	neck = /obj/item/clothing/neck/roguetown/gorget/copper
	mask = /obj/item/clothing/mask/rogue/facemask/copper
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
	gloves = /obj/item/clothing/gloves/roguetown/angle
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/spellbook_unfinished/pre_arcyne,
		/obj/item/flashlight/flare/torch,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)

	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
	r_hand = /obj/item/rogueweapon/sword/sabre/shamshir

	H.merctype = 4

// -- momentum stuff below

/obj/effect/proc_holder/spell/self/zeybek_momentum
	name = "Momentum"
	desc = "Enter a flow-state of deadly swordsmanship. For 60 seconds, each landed strike builds momentum, increasing level every 5 strikes. The first level of momentum gives +1 SPD, +1 WIL. The second doubles these effects. The third and final state gives Fortitude."
	overlay_state = "haste"
	recharge_time = 2 MINUTES
	ignore_cockblock = TRUE
	invocations = list("FLOW.") //K N E E L. You have
	invocation_type = "shout"
	sound = 'sound/magic/haste.ogg'
	var/momentum_style = "zeybek"

/obj/effect/proc_holder/spell/self/zeybek_momentum/zeybek
	momentum_style = "zeybek"

/obj/effect/proc_holder/spell/self/zeybek_momentum/janissary
	desc = "Steady your stance and grow unbreakable with each landed strike. For 60 seconds, each landed strike builds momentum, increasing level every 5 strikes. The first level of momentum gives +1 CON, +1 WIL. The second also grants +2 STR, +1 CON. The third grants Fortitude."
	invocations = list("BRACE.")
	momentum_style = "janissary"

/obj/effect/proc_holder/spell/self/zeybek_momentum/almah //unused; almah is prooobably fine
	desc = "Thread steel and sorcery together. For 60 seconds, each landed strike builds momentum, increasing level every 5 strikes. The first level of momentum gives +1 CON, +1 WIL. The second also grants +2 STR, +1 CON. The third grants Fortitude."
	invocations = list("TAPESTRY.")
	momentum_style = "almah"

/obj/effect/proc_holder/spell/self/zeybek_momentum/cast(mob/living/user)
	if(user.has_status_effect(/datum/status_effect/buff/zeybek_momentum))
		user.remove_status_effect(/datum/status_effect/buff/zeybek_momentum)
	user.apply_status_effect(/datum/status_effect/buff/zeybek_momentum, momentum_style)
	return TRUE

#define MOMENTUM_FILTER "zeybek_momentum_outline"
/atom/movable/screen/alert/status_effect/buff/zeybek_momentum
	name = "Momentum"
	desc = "My strikes are building into a deadly rhythm."
	icon_state = "buff"

/datum/status_effect/buff/zeybek_momentum
	id = "zeybek_momentum"
	alert_type = /atom/movable/screen/alert/status_effect/buff/zeybek_momentum
	duration = 60 SECONDS
	var/stacks = 0
	var/wil_bonus = 0
	var/spd_bonus = 0
	var/per_bonus = 0
	var/int_bonus = 0
	var/con_bonus = 0
	var/str_bonus = 0
	var/fortitude_active = FALSE
	var/afterimage_active = FALSE
	var/outline_colour = "#F4D35E"
	var/momentum_style = "zeybek"

/datum/status_effect/buff/zeybek_momentum/on_creation(mob/living/new_owner, style = "zeybek")
	momentum_style = style
	return ..()

/datum/status_effect/buff/zeybek_momentum/on_apply()
	. = ..()
	RegisterSignal(owner, COMSIG_MOB_ITEM_ATTACK_POST_SWINGDELAY, PROC_REF(on_attack))
	owner.add_filter(MOMENTUM_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 55, "size" = 1))
	to_chat(owner, span_notice("STACKING."))

/datum/status_effect/buff/zeybek_momentum/on_remove()
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_ITEM_ATTACK_POST_SWINGDELAY)
	owner.change_stat(STATKEY_WIL, -wil_bonus)
	owner.change_stat(STATKEY_SPD, -spd_bonus)
	owner.change_stat(STATKEY_PER, -per_bonus)
	owner.change_stat(STATKEY_INT, -int_bonus)
	owner.change_stat(STATKEY_CON, -con_bonus)
	owner.change_stat(STATKEY_STR, -str_bonus)
	wil_bonus = 0
	spd_bonus = 0
	per_bonus = 0
	int_bonus = 0
	con_bonus = 0
	str_bonus = 0
	stacks = 0
	if(fortitude_active)
		REMOVE_TRAIT(owner, TRAIT_FORTITUDE, STATUS_EFFECT_TRAIT)
		fortitude_active = FALSE
	owner.remove_filter(MOMENTUM_FILTER)
	if(afterimage_active)
		var/datum/component/after_image/after_image_component = owner.GetComponent(/datum/component/after_image)
		if(after_image_component)
			qdel(after_image_component)
		afterimage_active = FALSE
	to_chat(owner, span_warning("Expended."))

/datum/status_effect/buff/zeybek_momentum/proc/on_attack(mob/living/target, mob/living/user, obj/item/weapon)
	SIGNAL_HANDLER
	if(QDELETED(target) || !istype(target))
		return
	stacks++
	if(stacks == 5)
		apply_stack_bonus(1)
	else if(stacks == 10)
		apply_stack_bonus(2)
	else if(stacks == 15 && !fortitude_active)
		ADD_TRAIT(owner, TRAIT_FORTITUDE, STATUS_EFFECT_TRAIT)
		owner.AddComponent(/datum/component/after_image)
		afterimage_active = TRUE
		fortitude_active = TRUE
		to_chat(owner, get_final_momentum_message())
		playsound(owner, 'sound/magic/momentum_max.ogg', 100, TRUE, -1)

/datum/status_effect/buff/zeybek_momentum/proc/apply_stack_bonus(stack_level)
	switch(momentum_style)
		if("janissary")
			if(stack_level == 1)
				owner.change_stat(STATKEY_CON, 1)
				owner.change_stat(STATKEY_WIL, 1)
				con_bonus += 1
				wil_bonus += 1
				to_chat(owner, span_notice("BRACE."))
			else
				owner.change_stat(STATKEY_STR, 2) //probably too strong
				owner.change_stat(STATKEY_CON, 1)
				str_bonus += 2
				con_bonus += 1
				to_chat(owner, span_danger("CLOSE RANK."))
		if("almah")
			if(stack_level == 1)
				owner.change_stat(STATKEY_INT, 1)
				owner.change_stat(STATKEY_SPD, 1)
				int_bonus += 1
				spd_bonus += 1
				to_chat(owner, span_notice("THREAD."))
			else
				owner.change_stat(STATKEY_WIL, 1)
				owner.change_stat(STATKEY_INT, 1)
				owner.change_stat(STATKEY_SPD, 1)
				spd_bonus += 1
				wil_bonus += 1
				int_bonus += 1
				to_chat(owner, span_danger("COMPOSE."))
		else
			if(stack_level == 1)
				owner.change_stat(STATKEY_WIL, 1)
				owner.change_stat(STATKEY_SPD, 1)
				wil_bonus += 1
				spd_bonus += 1
				to_chat(owner, span_notice("ONE."))
			else
				owner.change_stat(STATKEY_WIL, 1)
				owner.change_stat(STATKEY_SPD, 1)
				owner.change_stat(STATKEY_PER, 1)
				wil_bonus += 1
				spd_bonus += 1
				per_bonus += 1
				to_chat(owner, span_danger("TWO."))

/datum/status_effect/buff/zeybek_momentum/proc/get_final_momentum_message()
	switch(momentum_style)
		if("janissary")
			return span_userdanger("BREAK THEIR FUCKING SKULLS.")
		if("almah")
			return span_userdanger("OBLITERATE THEIR WORLD, WEAVE SYMPHONY.")
		else
			return span_userdanger("I'VE GOT YOU NOW, FREEKSHIT.")

#undef MOMENTUM_FILTER
