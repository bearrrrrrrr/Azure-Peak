/obj/effect/proc_holder/spell/invoked/fortifyingvapors
	name = "Fortifying Vapors"
	desc = "An insuffulation of medicinal vapor. Provides long, slow healing."
	action_icon = 'icons/mob/actions/antiquarianspells.dmi'
	overlay_icon = 'icons/mob/actions/antiquarianspells.dmi'
	overlay_state = "fortifyingvapors"
	releasedrain = 3 SECONDS
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/diagnose.ogg'
	invocation_type = "emote"
	invocations = list("wafts clarifying vapor from a tin of smoldering herbs.")
	associated_skill = /datum/skill/misc/reading
	antimagic_allowed = FALSE
	recharge_time = 12 SECONDS
	miracle = FALSE
	devotion_cost = 0
	ignore_los = FALSE

/obj/effect/proc_holder/spell/invoked/fortifyingvapors/cast(list/targets, mob/living/user)
	. = ..()
	if(!isliving(targets[1]))
		revert_cast()
		return FALSE
	
	var/mob/living/target = targets[1]
	
	if(target.has_status_effect(/datum/status_effect/buff/fortifyingvapors))
		to_chat(user, span_warning("They are already under the effects of the vapors!"))
		revert_cast()
		return FALSE

	to_chat(target, span_warning("A heady scent fills my nostrils. My pulse quickens; I feel clear and sharp."))
	var/healing = 2.5 //not exactly sure where this appears in the healing code
	user.Beam(target, icon_state="lichbeam", time=1 SECONDS)
	target.apply_status_effect(/datum/status_effect/buff/fortifyingvapors, healing)
	target.playsound_local(target, 'sound/magic/heartbeat.ogg', 100)
	return TRUE


