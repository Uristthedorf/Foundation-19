/mob/living
	see_in_dark = 2
	see_invisible = SEE_INVISIBLE_LIVING
	waterproof = FALSE
	/// Whether or not the mob can be buckled to things.
	var/can_be_buckled = TRUE

	//Health and life related vars
	var/maxHealth = 100 //Maximum health that should be possible.
	var/health = 100 	//A mob's health

	var/mob_class =  null	// A mob's "class", e.g. human, mechanical, animal, etc. Used for certain projectile effects. See __defines/mob.dm for available classes.

	var/hud_updateflag = 0

	//Damage related vars, NOTE: THESE SHOULD ONLY BE MODIFIED BY PROCS // what a joke
	//var/bruteloss = 0 //Brutal damage caused by brute force (punching, being clubbed by a toolbox ect... this also accounts for pressure damage)
	//var/oxyloss = 0   //Oxygen depravation damage (no air in lungs)
	//var/toxloss = 0   //Toxic damage caused by being poisoned or radiated
	//var/fireloss = 0  //Burn damage caused by being way too hot, too cold or burnt.
	//var/halloss = 0   //Hallucination damage. 'Fake' damage obtained through hallucinating or the holodeck. Sleeping should cause it to wear off.

	var/last_special = 0 //Used by the resist verb, likely used to prevent players from bypassing next_move by logging in/out.
	var/base_attack_cooldown = CLICK_CD_ATTACK

	var/t_phoron = null
	var/t_oxygen = null
	var/t_sl_gas = null
	var/t_n2 = null

	var/can_rest = TRUE
	var/now_pushing = null
	var/mob_bump_flag = 0
	var/mob_swap_flags = 0
	var/mob_push_flags = 0
	var/mob_always_swap = 0

	var/mob/living/cameraFollow = null

	var/update_slimes = 1
	var/on_fire = 0 //The "Are we on fire?" var
	var/fire_stacks

	var/failed_last_breath = 0 //This is used to determine if the mob failed a breath. If they did fail a brath, they will attempt to breathe each tick, otherwise just once per 4 ticks.
	var/possession_candidate // Can be possessed by ghosts if unplayed.

	var/ear_damage = null	//Carbon

	var/job = null//Living
	var/list/obj/aura/auras = null //Basically a catch-all aura/force-field thing.

	var/last_resist = 0
	///For leaping and vaulting
	var/jumping = FALSE

	var/ghosted = 0 //For checks as to why a player has disconnected (can AI take over? etc.)
	var/admin_paralyzed = FALSE

	// var/nutrition = 400
	// var/max_nutrition = MAX_NUTRITION

	var/image/selected_image = null // Used for buildmode AI control stuff.

	var/datum/spell/ranged_ability ///Any ranged ability the mob has, as a click override

	/// List of active diseases
	var/list/diseases = list()
	/// List of diseases this mob has developed resistance to
	var/list/disease_resistances = list()

	/// A list of all status effects the mob has
	var/list/status_effects
