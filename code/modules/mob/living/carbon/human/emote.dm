/datum/emote/living/carbon/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "cries."
	emote_type = EMOTE_AUDIBLE
	needs_emotion = TRUE

/mob/living/carbon/human/verb/emote_cry()
	set name = "Cry"
	set category = "Noises"

	emote("cry", intentional = TRUE)

/datum/emote/living/carbon/human/cry/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise. Tears stream down their face."

/datum/emote/living/carbon/human/cry/run_emote(mob/user, params, type_override, intentional, targetted)
	. = ..()
	if(. && user.mind)
		record_featured_stat(FEATURED_STATS_EMOS, user)


/datum/emote/living/carbon/human/sexmoanlight
	key = "sexmoanlight"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	is_quiet = TRUE
	needs_emotion = TRUE

/datum/emote/living/carbon/human/sexmoanlight/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise."

/datum/emote/living/carbon/human/sexmoanhvy
	key = "sexmoanhvy"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	is_quiet = TRUE
	needs_emotion = TRUE

/datum/emote/living/carbon/human/sexmoanhvy/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise."

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "raises an eyebrow."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_eyebrow()
	set name = "Raise Eyebrow"
	set category = "Emotes"

	emote("eyebrow", intentional = TRUE)

/datum/emote/living/carbon/human/psst
	key = "psst"
	key_third_person = "pssts"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE

/mob/living/carbon/human/verb/emote_psst()
	set name = "Psst"
	set category = "Noises"

	emote("psst", intentional = TRUE)

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "grumbles."
	message_muffled = "makes a grumbling noise."
	emote_type = EMOTE_AUDIBLE

/mob/living/carbon/human/verb/emote_grumble()
	set name = "Grumble"
	set category = "Noises"

	emote("grumble", intentional = TRUE)

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "shakes their own hands."
	message_param = "shakes hands with %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "goes pale for a second."

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "raises a hand."
	restraint_check = TRUE

/datum/emote/living/carbon/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "salutes."
	message_param = "salutes to %t."
	restraint_check = TRUE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "shrugs."

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	message = "wags their tail."

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	if(!H.dna.species.is_wagging_tail(H))
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail(H))
		. = null

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "flaps their wings."

/mob/living/carbon/human/proc/OpenWings()
	return

/mob/living/carbon/human/proc/CloseWings()
	return

/mob/living/carbon/human/verb/hand_games()
	set name = "Handgames"
	set desc = "Challenge another to a variety of handgames, which can either be done while standing next to each other or while across a table."
	set category = "Emotes"

	if(stat)
		return

	if((!hand_bodyparts.len))
		to_chat(src, span_warning("You have no hands to play games with!"))
		return

	var/list/nearby = list()
	for(var/mob/living/carbon/human/H in range(src,1))
		if(H.stat)
			continue
		if(H == src)
			continue
		if(!H.hand_bodyparts.len)
			continue
		nearby |= H
	for(var/obj/structure/table/T in range(src, 1))
		for(var/mob/living/carbon/human/H in range(T,1))
			if(H.stat)
				continue
			if(H == src)
				continue
			if(!H.hand_bodyparts.len)
				continue
			nearby |= H

	if(!nearby.len)
		to_chat(src, span_warning("There is nobody nearby to play handgames with!"))

	var/partner = tgui_input_list(src, "Who will you challenge with a handgame?", "FRIEND TO FOE.", nearby)
	if(!partner)
		return
	var/choose_game = tgui_alert(src, "Choose a handgame to play with [partner]?", "A TOURNAMENT FOR TWO.", list("Rock, Paper, Shears", "Armwrestling", "Slaphands", "Thumbwars", "I Rescind"))

	if(!choose_game || (choose_game == "I Rescind"))
		return

	if(choose_game == "Rock, Paper, Shears")
		game_rps(src,partner)

	if(choose_game == "Armwrestling")
		game_armwrestle(src,partner)

	if(choose_game == "Slaphands")
		game_slaphands(src,partner)

	if(choose_game == "Thumbwars")
		game_thumbwars(src,partner)

// Checks to make sure everything is fine to continue playing.

/mob/living/carbon/human/proc/hand_games_check(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!istype(player1) || !istype(player2))
		return 0
	if(player1.stat || player2.stat) //Make sure they're still standing.
		return 0
	if(!(player2 in range(player1,2))) //Make sure they're within two spaces still; should allow for cross-table gaming.
		return 0

	return 1

///// A simple game of Rock Paper Scissors, each player chooses an option and the choices are declared simultaneously.

/mob/living/carbon/human/proc/game_rps(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1,player2))
		return
	to_chat(player1, span_notice("Asking [player2] if they want to play Rock, Paper, Shears!"))
	var/playgame = tgui_alert(player2, "[player1] wants to play Rock, Paper, Shears.", "FORTUNE FAVORS THE WITFUL.", list("Play", "Refuse"))
	if(!playgame || (playgame == "Refuse"))
		to_chat(player1, span_warning("[player2] declines to play the game."))
		return
	else
		player1.visible_message(span_notice("[player1] challenges [player2] to Rock, Paper, Shears!"))
		to_chat(player2, span_warning("[player1] is deciding."))
		var/choice1 = tgui_alert(player1, "Choose your attack!", "DEAL YOUR HAND.", list("Rock", "Paper", "Shears", "Cancel"))
		if(choice1 == "Cancel")
			player1.visible_message(span_notice("[player1] chickens out!"))
		if(!hand_games_check(player1,player2))
			return
		to_chat(player1, span_warning("[player2] is deciding."))
		var/choice2 = tgui_alert(player2, "Choose your attack!", "DEAL YOUR HAND.", list("Rock", "Paper", "Shears", "Cancel"))
		if(choice2 == "Cancel")
			player2.visible_message(span_notice("[player2] chickens out!"))
		if(!hand_games_check(player1,player2))
			return
		if(choice1 == choice2)
			player1.visible_message(span_notice("[player1] and [player2] both choose [choice1], it's a draw!"))
		else
			player1.visible_message(span_notice("[player1] chooses [choice1]!"))
			player2.visible_message(span_notice("[player2] chooses [choice2]!"))

/////// Armwrestling! Each player gets a modifier based on their size and can choose the strength of their character, then a weighted roll is made.

/mob/living/carbon/human/proc/game_armwrestle(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1,player2))
		return
	to_chat(player1, span_notice("Asking [player2] if they want to play Armwrestling!"))
	var/playgame = tgui_alert(player2, "[player1] wants to play Armwrestling.", "TEST YOUR MIGHT.", list("Play", "Refuse"))
	if(!playgame || (playgame == "Refuse"))
		to_chat(player1, span_warning("[player2] declines to play the game."))
		return
	else
		if(!hand_games_check(player1,player2))
			return
		player1.visible_message(span_notice("[player1] challenges [player2] to Armwrestling!"))
		//var/scale1 = player1.dna.features["body_size"] //Commented out, as I'm not too sure if we actually have this.
		//var/scale2 = player2.dna.features["body_size"] //A funny alternative might be to directly tie it to whatever sprite upscale percentage each side has?
		var/strength1 = player1.get_stat(STAT_STRENGTH)
		var/strength2 = player2.get_stat(STAT_STRENGTH)
		if(!hand_games_check(player1,player2))
			return

		var/score1 = (scale1 * strength1)
		var/score2 = (scale2 * strength2)

		var/competition = pick(score1;player1, score2;player2)
		if(!do_after(player1, 5 SECONDS, target = player2))
			player2.visible_message(span_notice("The players cancelled their competition!"))
			return 0
		if(!hand_games_check(player1,player2))
			return
		if(competition == player1)
			player1.visible_message(span_notice("[player1] manages to overpower [player2] and pin their arm down!"))
		else
			player2.visible_message(span_notice("[player2] manages to overpower [player1] and pin their arm down!"))

/////// Slaphands! Each player gets a modifier based on their size and can choose the reaction time of their character, then a weighted roll is made. This one gives the advantage to smaller players.

/mob/living/carbon/human/proc/game_slaphands(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1,player2))
		return
	to_chat(player1, span_notice("Asking [player2] if they want to play Slaphands!"))
	var/playgame = tgui_alert(player2, "[player1] wants to play Slaphands.", "QUICKEST TO THE DRAW.", list("Play", "Refuse"))
	if(!playgame || (playgame == "Refuse"))
		to_chat(player1, span_warning("[player2] declines to play the game."))
		return
	else
		if(!hand_games_check(player1,player2))
			return
		player1.visible_message(span_notice("[player1] challenges [player2] to Slaphands!"))
		var/speed1 = player1.get_stat(STAT_SPEED)
		var/speed2 = player2.get_stat(STAT_SPEED)
		var/per1 = player1.get_stat(STAT_PERCEPTION)
		var/per2 = player2.get_stat(STAT_PERCEPTION)
		if(!hand_games_check(player1,player2))
			return

		var/score1 = (speed1 + per1)
		var/score2 = (speed2 + per2)

		var/competition = pick(score1;player1, score2;player2)
		if(!do_after(player1, 3 SECONDS, target = player2))
			player2.visible_message(span_notice("The players cancelled their competition!"))
			return 0
		if(!hand_games_check(player1,player2))
			return
		playsound(player1, 'sound/foley/slap.ogg', 30, 1)
		if(competition == player1)
			player1.visible_message(span_notice("[player1] manages to slap [player2]'s hand before they can react!"))
		else
			player2.visible_message(span_notice("[player2] manages to slap [player1]'s hand before they can react!"))

///// Thumbwars! This one is pure chance, and - in a pinch - can essentially work like a cointoss.

/mob/living/carbon/human/proc/game_thumbwars(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1,player2))
		return
	to_chat(player1, span_notice("Asking [player2] if they want to play Thumbwars!"))
	var/playgame = tgui_alert(player2, "[player1] wants to play Thumbwars.", "ONE, TWO, THREE, FOUR..", list("Play", "Refuse"))
	if(!playgame || (playgame == "Refuse"))
		to_chat(player1, span_warning("[player2] declines to play the game."))
		return
	else
		if(!hand_games_check(player1,player2))
			return
		player1.visible_message(span_notice("[player1] challenges [player2] to a thumb war!"))
		if(!do_after(player1, 5 SECONDS, target = player2))
			player2.visible_message(span_notice("The players cancelled their thumb war!"))
			return 0
		if(!hand_games_check(player1,player2))
			return
		if(prob(50))
			player1.visible_message(span_notice("After a gruelling battle, [player1] eventually manages to subdue the thumb of [player2]!"))
		else
			player2.visible_message(span_notice("After a gruelling battle, [player2] eventually manages to subdue the thumb of [player1]!"))
