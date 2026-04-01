/obj/item/gun/ballistic/revolver/grenadelauncher/april_smg
	name = "AK47"
	desc = "Ancient Kazegun (weapon), Yil Fourty-Seven. Blessed by Astrata. Inverted solar flare deleting my ops."
	icon = 'icons/aprilfools/wawa.dmi'
	icon_state = "ak47"
	item_state = "ak47"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/april_smg
	w_class = WEIGHT_CLASS_NORMAL
	force = 8
	randomspread = 10
	spread = 5
	fire_sound = 'sound/aprilfoolsgun.ogg'
	load_sound = 'sound/foley/nockarrow.ogg'
	cartridge_wording = "round"
	verbage = "reload"

/obj/item/gun/ballistic/revolver/grenadelauncher/april_smg/attack_self(mob/living/user)
	if(!magazine)
		return
	if(magazine.ammo_count(FALSE) > 0)
		to_chat(user, span_warning("[src] still has boolet."))
		return

	var/loaded = 0
	while(magazine.ammo_count(FALSE) < magazine.max_ammo)
		var/obj/item/ammo_casing/new_round = new magazine.ammo_type(src)
		if(!magazine.give_round(new_round, TRUE))
			qdel(new_round)
			break
		loaded++

	if(!loaded)
		to_chat(user, span_warning("The april foolery fizzles, and [src] refuses to reload."))
		return

	chambered = null
	chamber_round()
	playsound(src, load_sound, 100, TRUE)
	to_chat(user, span_notice("I smack [src] and it magically reloads [loaded] rounds."))
	update_icon()

/obj/item/ammo_box/magazine/internal/shot/april_smg
	ammo_type = /obj/item/ammo_casing/caseless/rogue/sling_bullet/iron/meme
	caliber = "april_smg"
	max_ammo = 30

/obj/item/ammo_casing/caseless/rogue/sling_bullet/iron/meme
	name = "7.62 lead slug"
