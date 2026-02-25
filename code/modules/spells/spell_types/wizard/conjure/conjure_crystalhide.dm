/obj/effect/proc_holder/spell/self/conjure_armor/crystalhide
	name = "Conjure Crystalhide"
	desc = "Conjure a Crystalhide Barrier that wraps your whole body in brittle arcane crystal. Your armor slot must be free to use this.\n\
	When the barrier shatters or is dismissed, nearby foes are blasted backward."
	overlay_state = "conjure_dragonhide"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 70 //Cast This In Combat, I Dare You.
	chargedrain = 1
	chargetime = 5 SECONDS
	no_early_release = TRUE
	recharge_time = 5 MINUTES

	warnie = "spellwarning"
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 4
	spell_tier = 3

	invocations = list("Psymagia Congrego!") //COLLECT WORLDLINE.
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_MEDIUM

	objtoequip = /obj/item/clothing/suit/roguetown/crystalhide
	slottoequip = SLOT_ARMOR
	checkspot = "armor"
	cooldown_on_dissipate = TRUE

/obj/item/clothing/suit/roguetown/crystalhide
	name = "crystalhide"
	desc = "A shell of translucent arcyne crystal. Shatters violently into Signal-cut static-wind when broken.."
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "conjure_dragonhide"
	slot_flags = ITEM_SLOT_ARMOR
	mob_overlay_icon = null
	sleeved = null
	boobed = FALSE
	flags_inv = null
	armor_class = ARMOR_CLASS_LIGHT
	blade_dulling = DULLING_BASHCHOP
	blocksound = PLATEHIT
	armor = ARMOR_MAILLE
	max_integrity = ARMOR_INT_CHEST_LIGHT_BASE
	body_parts_covered = COVERAGE_ALL_BUT_HANDFEET | COVERAGE_HEAD_NOSE | NECK | HANDS | FEET
	unenchantable = TRUE
	var/obj/effect/proc_holder/spell/self/conjure_armor/linked_conjure_spell

/obj/item/clothing/suit/roguetown/crystalhide/proc/blast_back(mob/living/wearer)
	if(!wearer)
		return
	for(var/mob/living/target in oview(1, wearer))
		var/throwtarget = get_edge_target_turf(wearer, get_dir(wearer, get_step_away(target, wearer)))
		target.safe_throw_at(throwtarget, 2, 1, wearer, spin = FALSE, force = MOVE_FORCE_EXTREMELY_STRONG)

/obj/item/clothing/suit/roguetown/crystalhide/proc/dispel()
	if(QDELETED(src))
		return
	var/mob/living/wearer = istype(loc, /mob/living) ? loc : null
	src.visible_message(span_warning("The [src] fractures into a violent crystal burst!"))
	if(linked_conjure_spell)
		linked_conjure_spell.start_delayed_recharge()
	blast_back(wearer)
	qdel(src)

/obj/item/clothing/suit/roguetown/crystalhide/obj_break()
	. = ..()
	if(!QDELETED(src))
		dispel()

/obj/item/clothing/suit/roguetown/crystalhide/attack_hand(mob/living/user)
	. = ..()
	if(!QDELETED(src))
		dispel()

/obj/item/clothing/suit/roguetown/crystalhide/dropped(mob/living/user)
	. = ..()
	if(!QDELETED(src))
		dispel()
