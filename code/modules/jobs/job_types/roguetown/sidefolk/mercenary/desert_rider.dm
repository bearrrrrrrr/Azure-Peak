/datum/advclass/mercenary/desert_rider
	name = "Desert Rider Janissary"
	tutorial = "Janissaries are often ex-soldiers, recruited from one of the many city-states of Raneshen. Defection or a completed tour?; it hardly matters. With a shield, stout armor, and disciplined stance, they stand tall. Their Momentum gives them Strength."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider
	class_select_category = CLASS_CAT_RANESHENI
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg'
	subclass_languages = list(/datum/language/raneshi)
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
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
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
	to_chat(H, span_warning("The Desert Riders are a slightly-infamous band of mercenaries, as old and prestigious as Grenzelhoft's own. They have fought on both sides of nearly every conflict since the fall of the Celestial Empire."))
	head = /obj/item/clothing/head/roguetown/helmet/sallet/raneshen
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/chaincoif/full
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	gloves = /obj/item/clothing/gloves/roguetown/chain
	pants = /obj/item/clothing/under/roguetown/brigandinelegs
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/flashlight/flare/torch,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	var/weapons = list("Mace & Shield","Spear & Shield")
	if(H.mind)
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Mace & Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
				r_hand = /obj/item/rogueweapon/mace/goden/steel
				backl = /obj/item/rogueweapon/shield/tower/raneshen
			if("Spear & Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				r_hand = /obj/item/rogueweapon/spear
				backl = /obj/item/rogueweapon/shield/tower/raneshen
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltl = /obj/item/rogueweapon/sword/long/marlin
	beltr = /obj/item/rogueweapon/scabbard/sword

	H.merctype = 4

/datum/advclass/mercenary/desert_rider_zeybek
	name = "Desert Rider Zeybek"
	tutorial = "The Desert Riders are a band of mercenaries known for their loose morals and high effectiveness. From an evil, ignoble beginning as an infamous company meant to track down runaway slaves, they grew into a considerable force. Their skill with long and short blades are famed and feared the world over."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider_zeybek
	class_select_category = CLASS_CAT_RANESHENI
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg'
	subclass_languages = list(/datum/language/raneshi)
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
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/mercenary/desert_rider_zeybek/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/zeybek_momentum/zeybek)
	to_chat(H, span_warning("The Desert Riders are a slightly-infamous band of mercenaries, as old and prestigious as Grenzelhoft's own. They have fought on both sides of nearly every conflict since the fall of the Celestial Empire."))
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
	neck = /obj/item/clothing/neck/roguetown/leather
	mask = /obj/item/clothing/mask/rogue/facemask/steel/paalloy
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	gloves = /obj/item/clothing/gloves/roguetown/angle
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
	backr = /obj/item/storage/backpack/rogue/satchel/black
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
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
				beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
			if("Recurve Bow")
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
				backl = /obj/item/quiver/arrows
	H.merctype = 4

/datum/advclass/mercenary/desert_rider_sahir
	name = "Desert Rider Sahir"
	tutorial = "You're a Sahir - a wisened Magi from the desert of Raneshen. You have spent your lyfe studying the arcyne arts, and also knows of of the way of the sword - a necessity when one happens upon monstrsities that are resilient to magyck in the desert."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider_sahir
	class_select_category = CLASS_CAT_RANESHENI
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg'
	subclass_languages = list(/datum/language/raneshi)
	traits_applied = list(TRAIT_ARCYNE)
	subclass_stats = list(
		STATKEY_SPD = 1,
		STATKEY_WIL = 2,
		STATKEY_INT = 3,
		STATKEY_PER = 2
	)
	subclass_mage_aspects = list("mastery" = FALSE, "major" = 1, "minor" = 2, "utilities" = 6, "ward" = TRUE)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/mercenary/desert_rider_sahir/pre_equip(mob/living/carbon/human/H)
	..()

	// Gear - same as Almah but 1x blade + scholar's pouch
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
	neck = /obj/item/clothing/neck/roguetown/gorget/copper
	mask = /obj/item/clothing/mask/rogue/facemask/copper
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
	gloves = /obj/item/clothing/gloves/roguetown/angle
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/scabbard/sword
	r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
	l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/book/spellbook,
		/obj/item/flashlight/flare/torch,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	H.merctype = 4

/datum/advclass/mercenary/desert_rider_almah
	name = "Desert Rider Almah"
	tutorial = "You're an Almah - a blade dancer, trained in the arts of spellbladery, an art originating from Azurea in ancient time. Your people have refined spellbladery into an artform. They call you a bladedancer - for the beautiful, bloody tapestry of magycks and blade you weave out of your foes in battle."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider_almah
	class_select_category = CLASS_CAT_RANESHENI
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg'
	subclass_languages = list(/datum/language/raneshi)
	traits_applied = list(TRAIT_ARCYNE)
	subclass_stats = list(
		STATKEY_SPD = 1, // Weighted 7. Swap str for spd
		STATKEY_INT = 1, // Weighted 7. But a very nice statblock
		STATKEY_PER = 1, 
		STATKEY_CON = 1,
		STATKEY_WIL = 2, // With 2 Wil they should not be struggling
	)
	subclass_mage_aspects = list("mastery" = FALSE, "major" = 0, "minor" = 0, "utilities" = 4, "ward" = TRUE)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/mercenary/desert_rider_almah
	var/subclass_selected

/datum/outfit/job/roguetown/mercenary/desert_rider_almah/Topic(href, href_list)
	. = ..()
	if(href_list["subclass"])
		subclass_selected = href_list["subclass"]
	else if(href_list["close"])
		if(!subclass_selected)
			subclass_selected = "blade"

/datum/outfit/job/roguetown/mercenary/desert_rider_almah/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You start with Bind Weapon. Remember to Bind your weapon so you can use your abilities and build up Arcyne Momentum."))

	// Gear - mirrors Zeybek
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
	neck = /obj/item/clothing/neck/roguetown/gorget/copper
	mask = /obj/item/clothing/mask/rogue/facemask/copper
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
	wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
	gloves = /obj/item/clothing/gloves/roguetown/angle
	pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	belt = /obj/item/storage/belt/rogue/leather/shalal
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/clothing/neck/roguetown/shalal,
		/obj/item/flashlight/flare/torch,
		/obj/item/storage/belt/rogue/pouch/coins/poor,
		/obj/item/book/spellbook
		)

	// Spellblade chant selection - almah faction, blade choice is locked to shamshirs
	subclass_selected = null
	var/selection_html = get_spellblade_chant_html(src, H, "almah")
	H << browse(selection_html, "window=spellblade_chant;size=1100x900")
	onclose(H, "spellblade_chant", src)

	var/open_time = world.time
	while(!subclass_selected && world.time - open_time < 5 MINUTES)
		stoplag(1)
	H << browse(null, "window=spellblade_chant")

	if(!subclass_selected)
		subclass_selected = "blade"

	var/datum/status_effect/buff/arcyne_momentum/momentum = H.apply_status_effect(/datum/status_effect/buff/arcyne_momentum)
	if(momentum)
		momentum.chant = subclass_selected

	if(H.mind)
		switch(subclass_selected)
			if("blade")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				H.mind.AddSpell(new /datum/action/cooldown/spell/caedo)
				H.mind.AddSpell(new /datum/action/cooldown/spell/air_strike)
				H.mind.AddSpell(new /datum/action/cooldown/spell/leyline_anchor)
				H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/blade_storm)
			if("phalangite")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
				H.mind.AddSpell(new /datum/action/cooldown/spell/azurean_phalanx)
				H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/azurean_pilum)
				H.mind.AddSpell(new /datum/action/cooldown/spell/advance)
				H.mind.AddSpell(new /datum/action/cooldown/spell/gate_of_reckoning)
			if("macebearer")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
				H.mind.AddSpell(new /datum/action/cooldown/spell/shatter)
				H.mind.AddSpell(new /datum/action/cooldown/spell/tremor)
				H.mind.AddSpell(new /datum/action/cooldown/spell/charge)
				H.mind.AddSpell(new /datum/action/cooldown/spell/cataclysm)

		H.mind.AddSpell(new /datum/action/cooldown/spell/recall_weapon)
		H.mind.AddSpell(new /datum/action/cooldown/spell/empower_weapon)
		H.mind.AddSpell(new /datum/action/cooldown/spell/bind_weapon)
		H.mind.AddSpell(new /datum/action/cooldown/spell/mending)

	switch(subclass_selected)
		if("blade")
			var/blade_weapons = list("Dual Shamshirs", "Shalal Saber & Shield")
			var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in blade_weapons
			switch(weapon_choice)
				if("Dual Shamshirs")
					ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
					r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
					l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
					beltl = /obj/item/rogueweapon/scabbard/sword
					beltr = /obj/item/rogueweapon/scabbard/sword
				if("Shalal Saber & Shield")
					r_hand = /obj/item/rogueweapon/sword/long/marlin
					beltr = /obj/item/rogueweapon/scabbard/sword
					backl = /obj/item/rogueweapon/shield/tower/raneshen
		if("phalangite")
			var/polearm_weapons = list("Spear", "Dory & Shield")
			var/polearm_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in polearm_weapons
			switch(polearm_choice)
				if("Spear")
					r_hand = /obj/item/rogueweapon/spear
					backl = /obj/item/rogueweapon/scabbard/gwstrap
				if("Dory & Shield")
					r_hand = /obj/item/rogueweapon/spear/spellblade
					backl = /obj/item/rogueweapon/shield/tower/raneshen
		if("macebearer")
			var/mace_weapons = list("Steel Mace", "Steel Warhammer & Shield")
			var/mace_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in mace_weapons
			switch(mace_choice)
				if("Steel Mace")
					r_hand = /obj/item/rogueweapon/mace/steel
				if("Steel Warhammer & Shield")
					r_hand = /obj/item/rogueweapon/mace/warhammer/steel
					backl = /obj/item/rogueweapon/shield/tower/raneshen

	H.merctype = 4
