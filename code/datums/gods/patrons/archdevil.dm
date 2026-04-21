/datum/patron/vheslyn
	name = "Vheslyn"
	domain = "Unreality. The space in between your world and nothingness. The back of your amygdala."
	desc = "The Archdevil, the Great Worm, the Earth Mover, the Leviathan, the Defiler, the Unmaker. The rottting worm at the center of a discarded apple. The embodiment of pure evil that seeketh to sunder the world in fire and agony, to return it all to nonexistence. There will be no forgiveness or mercy for you, and you will give none in return."
	worshippers = "Accelerationists, Extremists, Nihilists, Sadists, Freaks, Wretches, and You."
	associated_faith = /datum/faith/accelerationism
	preference_accessible = TRUE
	undead_hater = TRUE
	confess_lines = list(
		"HELL IS REAL. LET CHAOS BE MYNE LAMPTERN.",
	)

/datum/patron/archdevil/can_pray(mob/living/follower)
	. = ..()
	. = FALSE
	to_chat(follower, span_danger("... NOTHING RESPONDS."))
	return FALSE