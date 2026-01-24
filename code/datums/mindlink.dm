GLOBAL_LIST_EMPTY(mindlinks)

/datum/mindlink
	var/mob/living/owner
	var/mob/living/target
	var/active = TRUE

/datum/mindlink/New(mob/living/owner, mob/living/target)
	src.owner = owner
	src.target = target
	
	RegisterSignal(owner, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	RegisterSignal(target, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/mindlink/Destroy()
	UnregisterSignal(owner, COMSIG_MOB_SAY)
	UnregisterSignal(target, COMSIG_MOB_SAY)
	owner = null
	target = null
	return ..()

/datum/mindlink/proc/handle_speech(mob/living/speaker, list/speech_args)
	SIGNAL_HANDLER
	
	var/message = speech_args[SPEECH_MESSAGE]
	if(!message)
		return
	
	// Check for the ,y prefix
	if(findtext(message, ",y", 1, 3))
		message = trim(copytext(message, 3))
		message = span_centcomradio("[message]")
		var/mob/living/recipient = (speaker == owner ? target : owner)
		
		var/audible_message = "The voice of [speaker] echoes, \"<i>[message]</i>\"."
		recipient.audible_message(audible_message, runechat_message = message, is_emote = FALSE)
		playsound(recipient, 'sound/magic/mindlink.ogg', 100, TRUE)
		playsound(speaker, 'sound/magic/mindlink.ogg', 100, TRUE)
		speech_args[SPEECH_MESSAGE] = message
		speaker.log_talk(message, LOG_SAY, tag="mindlink (to [recipient])")
