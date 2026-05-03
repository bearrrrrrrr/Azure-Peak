// T3 Lacrima (plunge your hand into someone's ribs to rip out their impure lux for your diabolical uses)

/obj/effect/proc_holder/spell/invoked/lacrima
	name = "Lacrima"
	desc = "Requires an aggressive grab on a floored, living victim. Plunge your hand into their chest, shattering their ribs and will alike in order to forcefully tear the lux from their body."
	button_icon = 'icons/mob/actions/zizomiracles.dmi'
	button_icon_state = "zizograsp"
	clothes_req = FALSE
	chargedrain = 0
	chargetime = 0
	releasedrain = 5
	miracle = TRUE
	devotion_cost = 20
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	invocations = list("Your lux belongs to the Dame!")
	invocation_type = "shout"

/obj/effect/proc_holder/spell/invoked/lacrima/free
	miracle = FALSE

/obj/effect/proc_holder/spell/invoked/lacrima/cast(list/targets, mob/living/carbon/human/user)
	if(!ishuman(user))
		revert_cast()
		return FALSE

	if(user.pulling && ishuman(user.pulling) && user.grab_state >= GRAB_AGGRESSIVE)
		lux_rip(user.pulling, user)
		return TRUE

	var/obj/item/reagent_containers/lux/nearby_lux = locate(/obj/item/reagent_containers/lux) in range(1, user)
	if(nearby_lux && !istype(nearby_lux, /obj/item/reagent_containers/lux_impure))
		perverse_lux(nearby_lux, user)
		return TRUE

	to_chat(user, span_warning("I need an aggressive grab on a floored victim, or be next to pure lux, to use Lacrima!"))
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/lacrima/proc/lux_rip(mob/living/carbon/human/target, mob/living/carbon/human/user)
	var/break_time = 100
	var/tear_time = 50

	if(target == user)
		to_chat(user, span_alert("I shouldn't rip out my own lux! I need that."))
		return
	if(!target.mind)
		to_chat(user, span_info("This one's lux is weak and insufficient. I need a victim with higher consciousness!"))
		return
	if(!isliving(target))
		to_chat(user, span_info("Only lyving creachers may have their lux torn."))
		return
	if(!target.Adjacent(user))
		to_chat(user, span_info("I need to be next to [target] to rip out their lux."))
		return
	if((target.mobility_flags & MOBILITY_STAND))
		to_chat(user, span_info("My target must be lying down to have their lux torn."))
		return
	if(target.has_status_effect(/datum/status_effect/debuff/devitalised) || target.mob_biotypes & MOB_UNDEAD) //can't farm your skeletons
		to_chat(user, span_notice("This one's lux is already disturbed!"))
		return
	else
		to_chat(user, span_alert("I begin reaching my hand towards [target], preparing to tear their lux from their body..."))
		user.visible_message(span_alert("[user] reaches towards [target]'s chest, inhumen flames wreathing [user.p_their()] hand..."))
	var/obj/item/bodypart/chest = target.get_bodypart(BODY_ZONE_CHEST)
	if(!chest.has_wound(/datum/wound/fracture/chest))
		if(!do_after(user, break_time, target = target))
			return
		if(chest)
			if(!HAS_TRAIT(target, TRAIT_NOPAIN))
				target.emote("painscream")
			chest.add_wound(/datum/wound/fracture/chest)
			target.apply_damage(50, BRUTE, BODY_ZONE_CHEST)
			user.visible_message(span_alert("[user] plunges their fist into [target]'s ribcage, shattering it spectacularly!"))
	if(!do_after(user, tear_time, target = target) && chest.has_wound(/datum/wound/fracture/chest))
		return
	if(!HAS_TRAIT(target, TRAIT_NOPAIN))
		target.emote("painscream")
		target.add_stress(/datum/stressevent/myfuckingluxman)
	playsound(user, 'sound/items/blackmirror_needle.ogg', 60, FALSE, 3)
	user.visible_message(span_alert("[user] tears a glob of lux from [target]'s chest!"))
	new /obj/item/reagent_containers/lux_impure(target.loc)
	SEND_SIGNAL(user, COMSIG_LUX_EXTRACTED, target)
	record_featured_stat(FEATURED_STATS_CRIMINALS, user)
	record_round_statistic(STATS_LUX_HARVESTED)
	target.apply_status_effect(/datum/status_effect/debuff/devitalised)

/datum/stressevent/myfuckingluxman
	desc = span_boldred("THE ESSENCE OF MY LYFE HAS BEEN DEFILED!!")
	stressadd = 30
	timer = 5 MINUTES

/obj/effect/proc_holder/spell/invoked/lacrima/proc/perverse_lux(obj/item/reagent_containers/lux/target, mob/living/carbon/human/user)
	var/perverse_time = 20

	if(!target.Adjacent(user))
		to_chat(user, span_info("I need to get closer."))
		return
	to_chat(user, span_alert("I begin molding the [target] in my hands, perversing it with inhumen energies..."))
	if(!do_after(user, perverse_time, target = target))
		return
	qdel(target)
	user.put_in_hands(new /obj/item/reagent_containers/lux_impure, forced = TRUE)
