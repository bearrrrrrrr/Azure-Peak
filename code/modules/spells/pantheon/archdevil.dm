// T0: Dodge Roll - brief phasing roll inspired by the profane dagger special.
/obj/effect/proc_holder/spell/self/vheslyn_dodge_roll
	name = "Dodge Roll"
	desc = "Invoke Vheslyn's unmaking grace to slip through flesh and steel for a fleeting moment."
	action_icon = 'icons/mob/actions/graggarmiracles.dmi'
	overlay_icon = 'icons/mob/actions/graggarmiracles.dmi'
	overlay_state = "breakchains"
	recharge_time = 30 SECONDS
	invocations = list("UNMAKE MY FLESH.", "LET ME SLIP THE WORLD.")
	invocation_type = "shout"
	sound = 'sound/combat/dodge.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 25
	antimagic_allowed = FALSE
	range = 0

/obj/effect/proc_holder/spell/self/vheslyn_dodge_roll/cast(list/targets, mob/user)
	. = ..()
	if(!isliving(user))
		revert_cast()
		return FALSE

	var/mob/living/living_user = user
	living_user.apply_status_effect(/datum/status_effect/buff/vheslyn_dodge_roll)
	return TRUE
