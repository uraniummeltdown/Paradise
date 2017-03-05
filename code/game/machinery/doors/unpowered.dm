/obj/machinery/door/unpowered
	var/locked = 0
	explosion_block = 1

/obj/machinery/door/unpowered/Bumped(atom/AM)
	if(locked)
		return
	..()

/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(locked)
		return
	..()

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	icon_state = "door1"
