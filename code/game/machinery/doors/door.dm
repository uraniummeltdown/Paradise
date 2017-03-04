//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31
#define DOOR_OPEN_LAYER 2.7		//Under all objects if opened. 2.7 due to tables being at 2.6
#define DOOR_CLOSED_LAYER 3.1	//Above most items if closed

/obj/machinery/door
	name = "door"
	desc = "It opens and closes."
	icon = 'icons/obj/doors/Doorint.dmi'
	icon_state = "door1"
	anchored = 1
	opacity = 1
	density = 1
	layer = DOOR_OPEN_LAYER
	power_channel = ENVIRON
	var/open_layer = DOOR_OPEN_LAYER
	var/closed_layer = DOOR_CLOSED_LAYER
	var/electrified_until = 0
	var/shockedby = list()
	var/visible = 1
	var/operating = 0
	var/glass = 0
	var/welded = 0
	var/normalspeed = 1
	var/heat_proof = 0 // For rglass-windowed airlocks/opacity firedoors
	var/emergency = 0 // Emergency access override
	var/sub_door = 0 // 1 if it's meant to go under another door.
	var/autoclose = 0 //does it automatically close after some time
	var/safe = 1 //whether the door detects things and mobs in its way and reopen or crushes them.
	var/locked = 0 //whether the door is bolted or not.
	var/assemblytype //the type of door frame to drop during deconstruction
	var/datum/effect/system/spark_spread/spark_system
	var/air_properties_vary_with_direction = 0
	var/block_air_zones = 1 //If set, air zones cannot merge across the door even when it is opened.

	//Multi-tile doors
	dir = EAST
	var/width = 1

/obj/machinery/door/New()
	..()
	if(density)
		layer = closed_layer
	else
		layer = open_layer


	if(width > 1)
		if(dir in list(EAST, WEST))
			bound_width = width * world.icon_size
			bound_height = world.icon_size
		else
			bound_width = world.icon_size
			bound_height = width * world.icon_size

	update_freelook_sight()
	air_update_turf(1)
	airlocks += src
	spark_system = new /datum/effect/system/spark_spread
	spark_system.set_up(2, 1, src)

/obj/machinery/door/Destroy()
	density = 0
	air_update_turf(1)
	update_freelook_sight()
	airlocks -= src
	if(spark_system)
		qdel(spark_system)
		spark_system = null
	return ..()

/obj/machinery/door/Bumped(atom/AM)
	if(operating || emagged)
		return
	if(ismob(AM))
		var/mob/B = AM
		if(isrobot(B) && B.stat)
			return
		if(isliving(AM))
			var/mob/living/M = AM
			if(world.time - M.last_bumped <= 10)
				return	//Can bump-open one airlock per second. This is to prevent shock spam.
			M.last_bumped = world.time
			if(M.restrained() && !check_access(null))
				return
			bumpopen(M)
			return

	if(istype(AM, /obj/mecha))
		var/obj/mecha/mecha = AM
		if(density)
			if(mecha.occupant)
				if(world.time - mecha.occupant.last_bumped <= 10)
					return
				mecha.occupant.last_bumped = world.time
			if(mecha.occupant && (allowed(mecha.occupant) || check_access_list(mecha.operation_req_access)))
				open()
			else
				do_animate("deny")
		return
	return

/obj/machinery/door/Move(new_loc, new_dir)
	var/turf/T = loc
	..()
	move_update_air(T)

	if(width > 1)
		if(dir in list(EAST, WEST))
			bound_width = width * world.icon_size
			bound_height = world.icon_size
		else
			bound_width = world.icon_size
			bound_height = width * world.icon_size

/obj/machinery/door/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group)
		return 0
	if(istype(mover) && mover.checkpass(PASSGLASS))
		return !opacity
	return !density

/obj/machinery/door/CanAtmosPass()
	return !density

/obj/machinery/door/proc/bumpopen(mob/user)
	if(operating)
		return
	add_fingerprint(user)
	if(!requiresID())
		user = null

	if(density && !emagged)
		if(allowed(user))
			open()
		else
			do_animate("deny")
	return

/obj/machinery/door/attack_ai(mob/user)
	return attack_hand(user)

/obj/machinery/door/attack_ghost(mob/user)
	if(user.can_advanced_admin_interact())
		return attack_hand(user)

obj/machinery/door/proc/attack_generic(mob/user, damage = 0, damage_type = BRUTE)
	if(operating)
		return
	user.do_attack_animation(src)
	user.changeNext_move(CLICK_CD_MELEE)
	user.visible_message("<span class='danger'>[user] smashes against the [name]!</span>", \
				"<span class='userdanger'>You smash against the [name]!</span>")
	take_damage(damage, damage_type)

/obj/machinery/door/attack_slime(mob/living/carbon/slime/S)
	if(!S.is_adult)
		attack_generic(S, 0)
	else
		attack_generic(S, 25)

/obj/machinery/door/attack_hand(mob/user)
	return try_to_activate_door(user)

/obj/machinery/door/attack_tk(mob/user)
	if(requiresID() && !allowed(null))
		return
	..()

/obj/machinery/door/proc/try_to_activate_door(mob/user)
	add_fingerprint(user)
	if(operating || emagged)
		return
	if(!requiresID())
		user = null //so allowed(user) always succeeds
	if(allowed(user))
		if(density)
			open()
		else
			close()
		return
	if(density)
		do_animate("deny")

/obj/machinery/door/allowed(mob/M)
	if(emergency)
		return TRUE
	return ..()

/obj/machinery/door/proc/try_to_weld(obj/item/weapon/weldingtool/W, mob/user)
	return

/obj/machinery/door/proc/try_to_crowbar(obj/item/I, mob/user)
	return

/obj/machinery/door/blob_act()
	if(prob(40))
		qdel(src)
	return

/obj/machinery/door/attackby(obj/item/I, mob/user, params)
	if(user.a_intent != I_HARM && (iscrowbar(I) || istype(I, /obj/item/weapon/twohanded/fireaxe)))
		try_to_crowbar(I, user)
		return 1
	else if(iswelder(I))
		try_to_weld(I, user)
		return 1
	else if(!(I.flags & NOBLUDGEON) && user.a_intent != I_HARM)
		try_to_activate_door(user)
		return 1
	else
		return ..()

obj/machinery/door/proc/take_damage(damage, damage_type = BRUTE, sound_effect = 1)
	switch(damage_type)
		if(BRUTE)
			if(sound_effect)
				if(glass)
					playsound(loc, 'sound/effects/Glasshit.ogg', 90, 1)
				else
					playsound(loc, 'sound/weapons/smash.ogg', 50, 1)
		if(BURN)
			if(sound_effect)
				playsound(loc, 'sound/items/Welder.ogg', 100, 1)
		else
			return

/obj/machinery/door/emp_act(severity)
	if(prob(20/severity) && (istype(src,/obj/machinery/door/airlock) || istype(src,/obj/machinery/door/window)) )
		addtimer(src, "open")
	if(prob(40/severity))
		if(electrified_until == 0)
			electrified_until = -1
			shockedby += "\[[time_stamp()]\]EM Pulse"
			addtimer(src, "unelectrify", 300, 1)
	..()

/obj/machinery/door/proc/unelectrify()
	electrified_until = 0

/obj/machinery/door/update_icon()
	if(density)
		icon_state = "door1"
	else
		icon_state = "door0"

/obj/machinery/door/proc/do_animate(animation)
	switch(animation)
		if("opening")
			if(panel_open)
				flick("o_doorc0", src)
			else
				flick("doorc0", src)
		if("closing")
			if(panel_open)
				flick("o_doorc1", src)
			else
				flick("doorc1", src)
		if("deny")
			if(!stat)
				flick("door_deny", src)

/obj/machinery/door/proc/open()
	if(!density)
		return 1
	if(operating)
		return
	if(!ticker || !ticker.mode)
		return 0
	operating = 1
	do_animate("opening")
	set_opacity(0)
	sleep(5)
	density = 0
	sleep(5)
	layer = open_layer
	update_icon()
	set_opacity(0)
	operating = 0
	air_update_turf(1)
	update_freelook_sight()
	if(autoclose)
		addtimer(src, "close", autoclose, 1)
	return 1

/obj/machinery/door/proc/close()
	if(density)
		return 1
	if(operating)
		return
	if(safe)
		for(var/atom/movable/M in get_turf(src))
			if(M.density && M != src) //something is blocking the door
				if(autoclose)
					addtimer(src, "autoclose", 60, 1)
				return
	operating = 1
	do_animate("closing")
	layer = closed_layer
	sleep(5)
	density = 1
	sleep(5)
	update_icon()
	if(visible && !glass)
		set_opacity(1)	//caaaaarn!
	operating = 0
	air_update_turf(1)
	update_freelook_sight()
	if(safe)
		CheckForMobs()
	else
		crush()
	return 1

/obj/machinery/door/proc/CheckForMobs()
	if(locate(/mob/living) in get_turf(src))
		sleep(1)
		open()

/obj/machinery/door/proc/crush()
	for(var/mob/living/L in get_turf(src))
		if(isalien(L))  //For xenos
			L.adjustBruteLoss(DOOR_CRUSH_DAMAGE * 1.5) //Xenos go into crit after aproximately the same amount of crushes as humans.
			L.emote("roar")
		else if(ishuman(L)) //For humans
			L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
			if(L.stat == CONSCIOUS)
				L.emote("scream")
			L.Weaken(5)
		else //for simple_animals & borgs
			L.adjustBruteLoss(DOOR_CRUSH_DAMAGE)
		var/turf/simulated/location = loc
		if(istype(location, /turf/simulated)) //add_blood doesn't work for borgs/xenos, but add_blood_floor does.
			location.add_blood_floor(L)

/obj/machinery/door/proc/autoclose()
	if(!qdeleted(src) && !density && !operating && !locked && !welded && autoclose)
		close()

/obj/machinery/door/proc/requiresID()
	return 1

/obj/machinery/door/proc/hasPower()
	return !(stat & NOPOWER)

/obj/machinery/door/proc/update_freelook_sight()
	// Glass door glass = 1
	// don't check then?
	if(!glass && cameranet)
		cameranet.updateVisibility(src, 0)

/obj/machinery/door/BlockSuperconductivity() // All non-glass airlocks block heat, this is intended.
	if(opacity || heat_proof)
		return 1
	return 0

/obj/machinery/door/morgue
	icon = 'icons/obj/doors/doormorgue.dmi'

/obj/machinery/door/proc/lock()
	return
/obj/machinery/door/proc/unlock()
	return

/obj/machinery/door/proc/hostile_lockdown(mob/origin)
	if(!stat) //So that only powered doors are closed.
		close() //Close ALL the doors!

/obj/machinery/door/proc/disable_lockdown()
	if(!stat) //Opens only powered doors.
		open() //Open everything!

/obj/machinery/door/ex_act(severity, target)
	//if it blows up a wall it should blow up a door
	..(severity ? max(1, severity - 1) : 0, target)
