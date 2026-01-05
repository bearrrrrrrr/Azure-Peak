/obj/effect/proc_holder/spell/invoked/projectile/shrapnelbloom
	name = "Alkahest Efflorescence"
	desc = "Burst three sharpened onyxian shards cut from the Mount Golgotha. Close-range. Strips away a fully-stacked Arcane Mark to briefly Expose an enemy."
	range = 5
	projectile_type = /obj/projectile/energy/shrapnelbloom
	projectiles_per_fire = 3
	overlay_state = "air_blade"
	sound = list('sound/magic/scrapeblade.ogg')
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 1
	recharge_time = 7 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	spell_tier = 2
	invocations = list("Golgotha enflux!")
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 3

/obj/projectile/energy/shrapnelbloom
	name = "stygian harpe"
	icon_state = "chronobolt"
	color = "#1c1c1c" //>literally codersprited
	damage = 35
	woundclass = BCLASS_CUT
	armor_penetration = 50
	npc_simple_damage_mult = 1.5
	hitsound = 'sound/combat/hits/bladed/smallslash (1).ogg'

/obj/projectile/energy/shrapnelbloom/on_hit(target)
	. = ..()

	if(ismob(target))
		if(M.anti_magic_check())
			visible_message(span_warning("[src] shatters on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK

/obj/effect/proc_holder/spell/invoked/projectile/shrapnelbloom/ready_projectile(obj/projectile/P, atom/target, mob/user, iteration) //dude this is all copy-paste guessed from other servers and ai slop. if this shit works id be so surprised
	var/base_angle = P.Angle
	if(isnull(base_angle))
		base_angle = Get_Angle(user, target)
	var/spread_step = 10
	var/center_index = (projectiles_per_fire + 1) / 2
	P.Angle = base_angle + ((iteration - center_index) * spread_step)
