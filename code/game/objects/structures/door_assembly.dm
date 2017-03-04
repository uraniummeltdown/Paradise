/obj/structure/door_assembly
	name = "airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/public.dmi'
	icon_state = "construction"
	var/overlays_file = 'icons/obj/doors/airlocks/station/overlays.dmi'
	anchored = 0
	density = 1
	var/state = 0
	var/mineral = null
	var/typetext = ""
	var/icontext = ""
	var/obj/item/weapon/airlock_electronics/electronics = null
	var/airlock_type = /obj/machinery/door/airlock //the type path of the airlock once completed
	var/glass_type = /obj/machinery/door/airlock/glass
	var/can_deconstruct = TRUE
	var/created_name = null
	var/heat_proof_finished = 0 //whether to heat-proof the finished airlock
	var/material = null //icon state logic

/obj/structure/door_assembly/New()
	update_icon()
	..()

/obj/structure/door_assembly/door_assembly_0
	name = "airlock assembly"
	airlock_type = /obj/machinery/door/airlock
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_com
	name = "command airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	typetext = "command"
	icontext = "com"
	glass_type = /obj/machinery/door/airlock/glass_command
	airlock_type = /obj/machinery/door/airlock/command
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_com/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_sec
	name = "security airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	typetext = "security"
	icontext = "sec"
	glass_type = /obj/machinery/door/airlock/glass_security
	airlock_type = /obj/machinery/door/airlock/security
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_sec/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_eng
	name = "engineering airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	typetext = "engineering"
	icontext = "eng"
	glass_type = /obj/machinery/door/airlock/glass_engineering
	airlock_type = /obj/machinery/door/airlock/engineering
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_eng/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_min
	name = "mining airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	typetext = "mining"
	icontext = "min"
	glass_type = /obj/machinery/door/airlock/glass_mining
	airlock_type = /obj/machinery/door/airlock/mining
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_min/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_atmo
	name = "atmospherics airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	typetext = "atmos"
	icontext = "atmo"
	glass_type = /obj/machinery/door/airlock/glass_atmos
	airlock_type = /obj/machinery/door/airlock/atmos
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_atmo/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_research
	name = "research airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	typetext = "research"
	icontext = "res"
	glass_type = /obj/machinery/door/airlock/glass_research
	airlock_type = /obj/machinery/door/airlock/research
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_research/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_science
	name = "science airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	typetext = "science"
	icontext = "sci"
	glass_type = /obj/machinery/door/airlock/glass_science
	airlock_type = /obj/machinery/door/airlock/science
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_science/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_med
	name = "medical airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	typetext = "medical"
	icontext = "med"
	glass_type = /obj/machinery/door/airlock/glass_medical
	airlock_type = /obj/machinery/door/airlock/medical
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_med/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_mai
	name = "maintenance airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	typetext = "maintenance"
	icontext = "mai"
	glass_type = /obj/machinery/door/airlock/glass_maintenance
	airlock_type = /obj/machinery/door/airlock/maintenance
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_mai/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_ext
	name = "external airlock assembly"
	icon = 'icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	typetext = "external"
	icontext = "ext"
	glass_type = /obj/machinery/door/airlock/glass_external
	airlock_type = /obj/machinery/door/airlock/external
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_ext/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_fre
	name = "freezer airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	typetext = "freezer"
	icontext = "fre"
	airlock_type = /obj/machinery/door/airlock/freezer
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_hatch
	name = "airtight hatch assembly"
	icon = 'icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	typetext = "hatch"
	icontext = "hatch"
	airlock_type = /obj/machinery/door/airlock/hatch
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_mhatch
	name = "maintenance hatch assembly"
	icon = 'icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	typetext = "maintenance_hatch"
	icontext = "mhatch"
	airlock_type = /obj/machinery/door/airlock/maintenance_hatch
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_glass
	name = "glass airlock assembly"
	icon = 'icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'icons/obj/doors/airlocks/station2/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/glass
	anchored = 1
	state = 1
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_gold
	name = "gold airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/gold.dmi'
	airlock_type = /obj/machinery/door/airlock/gold
	anchored = 1
	state = 1
	mineral = "gold"

/obj/structure/door_assembly/door_assembly_silver
	name = "silver airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/silver.dmi'
	airlock_type = /obj/machinery/door/airlock/silver
	anchored = 1
	state = 1
	mineral = "silver"

/obj/structure/door_assembly/door_assembly_diamond
	name = "diamond airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/diamond.dmi'
	airlock_type = /obj/machinery/door/airlock/diamond
	anchored = 1
	state = 1
	mineral = "diamond"

/obj/structure/door_assembly/door_assembly_uranium
	name = "uranium airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/uranium.dmi'
	airlock_type = /obj/machinery/door/airlock/uranium
	anchored = 1
	state = 1
	mineral = "uranium"

/obj/structure/door_assembly/door_assembly_plasma
	name = "plasma airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/plasma.dmi'
	airlock_type = /obj/machinery/door/airlock/plasma
	anchored = 1
	state = 1
	mineral = "plasma"

/obj/structure/door_assembly/door_assembly_clown
	name = "bananium airlock assembly"
	desc = "Honk"
	icon = 'icons/obj/doors/airlocks/station/bananium.dmi'
	airlock_type = /obj/machinery/door/airlock/clown
	anchored = 1
	state = 1
	mineral = "bananium"

/obj/structure/door_assembly/door_assembly_mime
	name = "tranquillite airlock assembly"
	desc = "..."
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	airlock_type = /obj/machinery/door/airlock/mime
	anchored = 1
	state = 1
	mineral = "tranquillite"

/obj/structure/door_assembly/door_assembly_sandstone
	name = "sandstone airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/sandstone.dmi'
	airlock_type = /obj/machinery/door/airlock/sandstone
	anchored = 1
	state = 1
	mineral = "sandstone"

/obj/structure/door_assembly/door_assembly_highsecurity // Borrowing this until WJohnston makes sprites for the assembly
	name = "high security airlock assembly"
	icon = 'icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'icons/obj/doors/airlocks/highsec/overlays.dmi'
	typetext = "highsecurity"
	icontext = "highsec"
	airlock_type = /obj/machinery/door/airlock/highsecurity
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_vault
	name = "vault door assembly"
	icon = 'icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'icons/obj/doors/airlocks/vault/overlays.dmi'
	typetext = "vault"
	icontext = "vault"
	airlock_type = /obj/machinery/door/airlock/vault
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_shuttle
	name = "shuttle airlock assembly"
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	typetext = "shuttle"
	icontext = "shuttle"
	airlock_type = /obj/machinery/door/airlock/shuttle
	anchored = 1
	state = 1

/obj/structure/door_assembly/multi_tile
	icon = 'icons/obj/doors/door_assembly2x1.dmi'
	dir = EAST
	var/width = 1
	icontext = "g"
	airlock_type = /obj/machinery/door/airlock/multi_tile/

/obj/structure/door_assembly/door_assembly_ext/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/multi_tile/New()
	if(dir in list(EAST, WEST))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size
	update_icon()

/obj/structure/door_assembly/multi_tile/Move()
	. = ..()
	if(dir in list(EAST, WEST))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size


/obj/structure/door_assembly/door_assembly_cult
	name = "cult airlock assembly"
	icon = 'icons/obj/doors/airlocks/cult/runed/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/runed/overlays.dmi'
	typetext = "cult"
	icontext = "cult"
	airlock_type = /obj/machinery/door/airlock/cult
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_cult/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_cult/unruned
	icon = 'icons/obj/doors/airlocks/cult/unruned/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/unruned/overlays.dmi'

/obj/structure/door_assembly/door_assembly_cult/unruned/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_wood
	name = "wooden airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/wood.dmi'
	airlock_type = /obj/machinery/door/airlock/wood
	anchored = 1
	state = 1
	mineral = "wood"

/obj/structure/door_assembly/door_assembly_viro
	name = "virology airlock assembly"
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	typetext = "virology"
	icontext = "viro"
	glass_type = /obj/machinery/door/airlock/glass_virology
	airlock_type = /obj/machinery/door/airlock/virology
	anchored = 1
	state = 1

/obj/structure/door_assembly/door_assembly_viro/glass
	mineral = "glass"
	material = "glass"

/obj/structure/door_assembly/door_assembly_centcom
	typetext = "centcom"
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/centcom/overlays.dmi'
	icontext = "ele"
	airlock_type = /obj/machinery/door/airlock/centcom
	anchored = 1
	state = 1

/obj/structure/door_assembly/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weapon/pen))
		var/t = copytext(stripped_input(user, "Enter the name for the door.", name, created_name),1,MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t

	if(iswelder(W) && !anchored)
		var/obj/item/weapon/weldingtool/WT = W
		if(WT.remove_fuel(0, user))
			user.visible_message("<span class='warning'>[user] disassembles the airlock assembly.</span>", \
								"You start to disassemble the airlock assembly...")
			playsound(loc, 'sound/items/Welder2.ogg', 50, 1)
			if(do_after(user, 40, target = src))
				if(!WT.isOn())
					return
				to_chat(user, "<span class='notice'>You disassemble the airlock assembly.</span>")
				deconstruct(TRUE)
		else
			to_chat(user, "\blue You need more welding fuel.")
			return

	else if(iswrench(W))
		if(!anchored)
			var/door_check = 1
			for(var/obj/machinery/door/D in loc)
				if(!D.sub_door)
					door_check = 0
					break

			if(door_check)
				playsound(loc, 'sound/items/Ratchet.ogg', 100, 1)
				user.visible_message("[user] secures the airlock assembly to the floor.", \
									"<span class='notice'>You start to secure the airlock assembly to the floor...</span>", \
									"<span class='italics'>You hear wrenching.</span>")
				if(do_after(user, 40, target = src))
					if(!anchored)
						return
					to_chat(user, "\blue You secure the airlock assembly.")
					name = "secured airlock assembly"
					anchored = 1
				else
					to_chat(user, "There is another door here!")
			else
				playsound(loc, 'sound/items/Ratchet.ogg', 100, 1)
				user.visible_message("[user] unsecures the airlock assembly from the floor.", \
									 "<span class='notice'>You start to unsecure the airlock assembly from the floor...</span>", \
									 "<span class='italics'>You hear wrenching.</span>")
				if(do_after(user, 40, target = src))
					if(!anchored)
						return
					to_chat(user, "<span class='notice'>You unsecure the airlock assembly.</span>")
					name = "airlock assembly"
					anchored = 0

	else if(iscoil(W) && state == 0 && anchored )
		var/obj/item/stack/cable_coil/C = W
		if(C.get_amount() < 1)
			to_chat(user, "<span class='warning'>You need one length of cable to wire the airlock assembly!</span>")
			return
		user.visible_message("[user] wires the airlock assembly.", "You start to wire the airlock assembly...")
		if(do_after(user, 40, target = src))
			if(C.get_amount() < 1 || state != 0)
				return
			C.use(1)
			state = 1
			to_chat(user, "\blue You wire the airlock assembly.")
			name = "wired airlock assembly"

	else if(iswirecutter(W) && state == 1 )
		playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
		user.visible_message("[user] cuts the wires from the airlock assembly.", "You start to cut the wires from airlock assembly...")
		if(do_after(user, 40, target = src))
			if(state != 1)
				return
			to_chat(user, "\blue You cut the wires from the airlock assembly.")
			new/obj/item/stack/cable_coil(get_turf(user), 1)
			state = 0
			name = "secured airlock assembly"

	else if(istype(W, /obj/item/weapon/airlock_electronics) && state == 1 && W:icon_state != "door_electronics_smoked")
		playsound(loc, 'sound/items/Screwdriver.ogg', 100, 1)
		user.visible_message("[user] installs the electronics into the airlock assembly.", "You start to install electronics into the airlock assembly.")
		if(do_after(user, 40, target = src))
			if(state != 1)
				return
			if(!src)
				return
			if(!user.drop_item())
				return
			W.loc = src
			to_chat(user, "\blue You install the airlock electronics.")
			state = 2
			name = "near finished airlock assembly"
			electronics = W

	else if(iscrowbar(W) && state == 2)
		playsound(loc, 'sound/items/Crowbar.ogg', 100, 1)
		user.visible_message("[user] removes the electronics from the airlock assembly.", "You start to install electronics into the airlock assembly...")
		if(do_after(user, 40, target = src))
			if(state != 2)
				return
			if(!src)
				return
			to_chat(user, "\blue You remove the airlock electronics.")
			state = 1
			name = "wired airlock assembly"
			var/obj/item/weapon/airlock_electronics/ae
			if(!electronics)
				ae = new/obj/item/weapon/airlock_electronics( src.loc )
			else
				ae = electronics
				electronics = null
				ae.loc = src.loc

	else if(istype(W, /obj/item/stack/sheet) && !mineral)
		var/obj/item/stack/sheet/S = W
		if(S)
			if(S.get_amount() >= 1)
				if(istype(S, /obj/item/stack/sheet/rglass) || istype(S, /obj/item/stack/sheet/glass))
					playsound(loc, 'sound/items/Crowbar.ogg', 100, 1)
					user.visible_message("[user] adds [S.name] to the airlock assembly.", "You start to install [S.name] into the airlock assembly.")
					if(do_after(user, 40, target = src))
						if(S.get_amount() < 1 || mineral)
							return
						if(S.type == /obj/item/stack/sheet/rglass)
							to_chat(user, "<span class='notice'>You install reinforced glass windows into the airlock assembly.</span>")
							heat_proof_finished = 1 //reinforced glass makes the airlock heat-proof
							name = "near finished heat-proofed window airlock assembly"
						else
							to_chat(user, "<span class='notice'>You install regular glass windows into the airlock assembly.</span>")
							name = "near finished window airlock assembly"
						S.use(1)
						mineral = "glass"
						material = "glass"
				else if(istype(S, /obj/item/stack/sheet/mineral))
					var/M = S.sheettype
					if(S.get_amount() >= 2)
						playsound(loc, 'sound/items/Crowbar.ogg', 100, 1)
						user.visible_message("[user] adds [S.name] to the airlock assembly.", "You start to install [S.name] into the airlock assembly.")
						if(do_after(user, 40, target = src))
							if(S.get_amount() < 2 || mineral)
								return
							to_chat(user, "\blue You installed [M] plating into the airlock assembly!")
							S.use(2)
							mineral = "[M]"
							name = "near finished [M] airlock assembly"
							airlock_type = text2path ("/obj/machinery/door/airlock/[M]")
							glass_type = /obj/machinery/door/airlock/glass

	else if(isscrewdriver(W) && state == 2 )
		playsound(loc, 'sound/items/Screwdriver.ogg', 100, 1)
		to_chat(user, "\blue Now finishing the airlock.")
		if(do_after(user, 40, target = src))
			if(loc && state == 2)
				to_chat(user, "<span class='notice'>You finish the airlock.</span>")
				var/obj/machinery/door/airlock/door
				if(mineral == "glass")
					door = new glass_type(loc)
				else
					door = new airlock_type(loc)
				//door.req_access = src.req_access
				door.electronics = src.electronics
				door.heat_proof = src.heat_proof_finished
				if(src.electronics.one_access)
					door.req_access = null
					door.req_one_access = src.electronics.conf_access
				else
					door.req_access = src.electronics.conf_access
				if(created_name)
					door.name = created_name
				src.electronics.loc = door
				qdel(src)
	else
		return ..()
	update_icon()

/obj/structure/door_assembly/update_icon()
	overlays.Cut()
	if(!material)
		overlays += get_airlock_overlay("fill_construction", icon)
	else
		overlays += get_airlock_overlay("[material]_construction", overlays_file)
	overlays += get_airlock_overlay("panel_c[state+1]", overlays_file)

/obj/structure/door_assembly/proc/deconstruct(disassembled = TRUE)
	if(can_deconstruct)
		var/turf/T = get_turf(src)
		var/metal_amt = 4
		if(!disassembled)
			metal_amt = rand(2,4)
		new /obj/item/stack/sheet/metal(T, metal_amt)
		if(mineral)
			if (mineral == "glass")
				if(disassembled)
					if (heat_proof_finished)
						new /obj/item/stack/sheet/rglass(T)
					else
						new /obj/item/stack/sheet/glass(T)
				else
					new /obj/item/weapon/shard(T)
			else
				var/obj/item/stack/sheet/mineral/mineral_path = text2path("/obj/item/stack/sheet/mineral/[mineral]")
				new mineral_path(T, 2)
	qdel(src)
