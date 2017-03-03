/*
	Station Airlocks Regular
*/
/obj/machinery/door/airlock/command
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_com

/obj/machinery/door/airlock/security
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec

/obj/machinery/door/airlock/engineering
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_eng

/obj/machinery/door/airlock/medical
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_med

/obj/machinery/door/airlock/maintenance
	name = "maintenance access"
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_mai

/obj/machinery/door/airlock/mining
	name = "mining airlock"
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_min

/obj/machinery/door/airlock/atmos
	name = "atmospherics airlock"
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_atmo

/obj/machinery/door/airlock/research
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_research

/obj/machinery/door/airlock/freezer
	name = "freezer airlock"
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_fre

/obj/machinery/door/airlock/science
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_science

/obj/machinery/door/airlock/virology
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_viro

//////////////////////////////////
/*
	Station Airlocks Glass
*/

/obj/machinery/door/airlock/glass_command
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_com/glass
	glass = 1

/obj/machinery/door/airlock/glass_engineering
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_eng/glass
	glass = 1

/obj/machinery/door/airlock/glass_security
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_sec/glass
	glass = 1

/obj/machinery/door/airlock/glass_medical
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_med/glass
	glass = 1

/obj/machinery/door/airlock/glass_research
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_research/glass
	glass = 1

/obj/machinery/door/airlock/glass_mining
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_min/glass
	glass = 1

/obj/machinery/door/airlock/glass_atmos
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_atmo/glass
	glass = 1

/obj/machinery/door/airlock/glass_science
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_science/glass
	glass = 1

/obj/machinery/door/airlock/glass_virology
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_viro/glass
	glass = 1

/obj/machinery/door/airlock/glass_maintenance
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_mai/glass
	glass = 1

//////////////////////////////////
/*
	Station Airlocks Mineral
*/

/obj/machinery/door/airlock/gold
	name = "gold airlock"
	icon = 'icons/obj/doors/airlocks/station/gold.dmi'
	var/mineral = "gold"
	assemblytype = /obj/structure/door_assembly/door_assembly_gold

/obj/machinery/door/airlock/silver
	name = "silver airlock"
	icon = 'icons/obj/doors/airlocks/station/silver.dmi'
	var/mineral = "silver"
	assemblytype = /obj/structure/door_assembly/door_assembly_silver

/obj/machinery/door/airlock/diamond
	name = "diamond airlock"
	icon = 'icons/obj/doors/airlocks/station/diamond.dmi'
	var/mineral = "diamond"
	assemblytype = /obj/structure/door_assembly/door_assembly_diamond

/obj/machinery/door/airlock/uranium
	name = "uranium airlock"
	icon = 'icons/obj/doors/airlocks/station/uranium.dmi'
	var/mineral = "uranium"
	assemblytype = /obj/structure/door_assembly/door_assembly_uranium
	var/last_event = 0
	var/active = null

/obj/machinery/door/airlock/uranium/process()
	if(world.time > last_event+20)
		if(prob(50))
			radiate()
		last_event = world.time
	..()

/obj/machinery/door/airlock/uranium/proc/radiate()
	if(!active)
		if(world.time > last_event+15)
			active = 1
			for(var/mob/living/L in range(3,src))
				L.apply_effect(15,IRRADIATE,0)
			last_event = world.time
			active = null
			return
	return

/obj/machinery/door/airlock/plasma
	name = "plasma airlock"
	desc = "No way this can end badly."
	icon = 'icons/obj/doors/airlocks/station/plasma.dmi'
	var/mineral = "plasma"
	assemblytype = /obj/structure/door_assembly/door_assembly_plasma

/obj/machinery/door/airlock/plasma/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		PlasmaBurn(exposed_temperature)

/obj/machinery/door/airlock/plasma/proc/ignite(exposed_temperature)
	if(exposed_temperature > 300)
		PlasmaBurn(exposed_temperature)

/obj/machinery/door/airlock/plasma/proc/PlasmaBurn(temperature)
	atmos_spawn_air(SPAWN_HEAT | SPAWN_TOXINS, 500)
	new/obj/structure/door_assembly/door_assembly_0(loc)
	qdel(src)

/obj/machinery/door/airlock/plasma/BlockSuperconductivity() //we don't stop the heat~
	return 0

/obj/machinery/door/airlock/clown
	name = "bananium airlock"
	desc = "Honkhonkhonk"
	icon = 'icons/obj/doors/airlocks/station/bananium.dmi'
	var/mineral = "bananium"
	assemblytype = /obj/structure/door_assembly/door_assembly_clown

/obj/machinery/door/airlock/mime
	name = "tranquillite airlock"
	desc = "..."
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	var/mineral = "tranquillite"
	assemblytype = /obj/structure/door_assembly/door_assembly_mime

/obj/machinery/door/airlock/sandstone
	name = "sandstone airlock"
	icon = 'icons/obj/doors/airlocks/station/sandstone.dmi'
	var/mineral = "sandstone"
	assemblytype = /obj/structure/door_assembly/door_assembly_sandstone


/obj/machinery/door/airlock/wood
	name = "wooden airlock"
	icon = 'icons/obj/doors/airlocks/station/wood.dmi'
	var/mineral = "wood"
	assemblytype = /obj/structure/door_assembly/door_assembly_wood

//////////////////////////////////
/*
	Station2 Airlocks
*/

/obj/machinery/door/airlock/glass
	name = "glass airlock"
	icon = 'icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'icons/obj/doors/airlocks/station2/overlays.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_glass
	glass = 1

//////////////////////////////////
/*
	External Airlocks
*/

/obj/machinery/door/airlock/external
	name = "external airlock"
	icon = 'icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_ext

/obj/machinery/door/airlock/glass_external
	name = "external airlock"
	icon = 'icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_ext/glass
	opacity = 0
	glass = 1

//////////////////////////////////
/*
	Centcom Airlocks
*/

/obj/machinery/door/airlock/centcom
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/centcom/overlays.dmi'
	opacity = 1
	assemblytype = /obj/structure/door_assembly/door_assembly_centcom

//////////////////////////////////
/*
	Vault Airlocks
*/

/obj/machinery/door/airlock/vault
	name = "vault door"
	icon = 'icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'icons/obj/doors/airlocks/vault/overlays.dmi'
	opacity = 1
	assemblytype = /obj/structure/door_assembly/door_assembly_vault
	explosion_block = 2

//////////////////////////////////
/*
	Hatch Airlocks
*/

/obj/machinery/door/airlock/hatch
	name = "airtight hatch"
	icon = 'icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	opacity = 1
	assemblytype = /obj/structure/door_assembly/door_assembly_hatch

/obj/machinery/door/airlock/maintenance_hatch
	name = "maintenance hatch"
	icon = 'icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	opacity = 1
	assemblytype = /obj/structure/door_assembly/door_assembly_mhatch

//////////////////////////////////
/*
	High Security Airlocks
*/

/obj/machinery/door/airlock/highsecurity
	name = "high tech security airlock"
	icon = 'icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'icons/obj/doors/airlocks/highsec/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_highsecurity
	explosion_block = 2

/obj/machinery/door/airlock/highsecurity/red
	name = "Secure Armory Airlock"
	hackProof = 1
	aiControlDisabled = 1
//////////////////////////////////
/*
	Shuttle Airlocks
*/

/obj/machinery/door/airlock/shuttle
	name = "shuttle airlock"
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_shuttle

//////////////////////////////////
/*
	Cult Airlocks
*/

/obj/machinery/door/airlock/cult
	name = "cult airlock"
	icon = 'icons/obj/doors/airlocks/cult/runed/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/runed/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_cult
	hackProof = 1
	aiControlDisabled = 1
	var/openingoverlaytype = /obj/effect/overlay/temp/cult/door
	var/friendly = FALSE

/obj/machinery/door/airlock/cult/New()
	..()
	new openingoverlaytype(loc)

/obj/machinery/door/airlock/cult/canAIControl(mob/user)
	return (iscultist(user) && !isAllPowerLoss())

/obj/machinery/door/airlock/cult/allowed(mob/M)
	if(!density)
		return 1
	if(friendly || iscultist(M) || istype(M, /mob/living/simple_animal/shade) || istype(M, /mob/living/simple_animal/construct))
		new openingoverlaytype(loc)
		return 1
	else
		new /obj/effect/overlay/temp/cult/sac(loc)
		var/atom/throwtarget
		throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(M, src)))
		M << pick(sound('sound/hallucinations/turn_around1.ogg',0,1,50), sound('sound/hallucinations/turn_around2.ogg',0,1,50))
		M.Weaken(2)
		M.throw_at(throwtarget, 5, 1,src)
		return 0

/obj/machinery/door/airlock/cult/narsie_act()
	return

/obj/machinery/door/airlock/cult/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/glass
	assemblytype = /obj/structure/door_assembly/door_assembly_cult/glass
	glass = 1
	opacity = 0

/obj/machinery/door/airlock/cult/glass/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/unruned
	icon = 'icons/obj/doors/airlocks/cult/unruned/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/unruned/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_cult/unruned
	openingoverlaytype = /obj/effect/overlay/temp/cult/door/unruned

/obj/machinery/door/airlock/cult/unruned/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/unruned/glass
	assemblytype = /obj/structure/door_assembly/door_assembly_cult/unruned/glass
	glass = 1
	opacity = 0

/obj/machinery/door/airlock/cult/unruned/glass/friendly
	friendly = TRUE
//////////////////////////////////
/*
	Misc Airlocks
*/

/obj/machinery/door/airlock/glass_large
	name = "large glass airlock"
	icon = 'icons/obj/doors/airlocks/glass_large/glass_large.dmi'
	overlays_file = 'icons/obj/doors/airlocks/glass_large/overlays.dmi'
	opacity = 0
	assemblytype = null //(double glass door) there's no door assembly sprites for this one.
	glass = 1
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/alien
	name = "alien airlock"
	desc = "A mysterious alien airlock with a complicated opening mechanism."
	hackProof = 1
	icon = 'icons/obj/doors/airlocks/station/plasma.dmi'
	is_special = 1

/obj/machinery/door/airlock/alien/bumpopen(mob/living/user)
	if(isalien(user) || isrobot(user) || isAI(user))
		..(user)
	else
		to_chat(user, "You do not know how to operate this airlock's mechanism.")
		return

/obj/machinery/door/airlock/alien/attackby(obj/C, mob/user, params)
	if(isalien(user) || isrobot(user) || isAI(user))
		..(C, user)
	else
		to_chat(user, "You do not know how to operate this airlock's mechanism.")
		return
