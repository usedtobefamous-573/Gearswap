function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder', 'Fencer', 'Subtle')
	state.WeaponskillMode:options('Match', 'AttackCap', 'Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder', 'Proc')
	state.HybridMode:options('Normal', 'DT')
	state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
	state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT', 'Refresh', 'Reraise')
	state.ExtraMeleeMode = M { ['description'] = 'Extra Melee Mode', 'None' }
	state.Passive = M { ['description'] = 'Passive Mode', 'None', 'Twilight' }
	state.Weapons:options('None', 'Naegling', 'Loxotic', 'Chango', 'Shining1', 'DualWeapons', 'Greatsword', 'ProcSword', 'ProcDagger', 'ProcKatana', 'ProcGreatSword',
	'ProcScythe', 'ProcPolearm', 'ProcGreatKatana', 'ProcClub', 'ProcStaff')

	gear.da_jse_back = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken -5%',}}
	gear.wsd_str_jse_back = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken -5%',}}
	gear.wsd_vit_jse_back = {name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	-- gear.crit_jse_back = { name = "Cichol's Mantle", augments = { 'STR+20', 'Accuracy+20 Attack+20', 'Crit.hit rate+10' } }

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle Skill chainMode')
	--send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	--send_command('bind !q gs c set skipprocweapons false;gs c set weapons ProcSword;gs c set weaponskillmode proc')
	send_command('bind ^@!insert input //sm all follow')
	send_command('bind ^@!home input //sm mirror')
	send_command('bind ^@!pageup input //send Darkonyx //sm start')
	send_command('bind ^@!pagedown input //send Mydriatictofu //sm start')
	send_command('bind ^@!end input //send Darkonyx //sm stop')
	send_command('bind ^@!delete input //send Mydriatictofu //sm stop')
	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above

	send_command('bind !r gs c weapons Naegling ;gs c update')
    --send_command('bind ^q gs c weapons DualAeolian;gs c update')
    send_command('bind !q gs c weapons Loxotic;gs c update')

--	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	af = {}
		af.Head = "Pumm. Mask +2"
		af.Body = "Pumm. Lorica +2"
		af.Hands = "Pumm. Mufflers"
		af.Legs = "Pumm. Cuisses"
		af.Feet = "Pumm.  Calligae"

	relic = {}
		relic.Head = "Agoge Mask +3"
		relic.Body = "Agoge Lorica"
		relic.Hands = "Agoge Mufflers"
		relic.Legs = "Agoge Cuisses"
		relic.Feet = "Agoge Calligae"

	empy = {}
		empy.Head = "Boii Mask"
		empy.Body = "Boii Lorica"
		empy.Hands = "Boii Mufflers +1"
		empy.Legs = "Boii Cuisses"
		empy.Feet = "Boii Calligae"

    Nyame = {
        Head="Nyame Helm",
        Body="Nyame Mail",
        Hands="Nyame Gauntlets",
        Legs="Nyame Flanchard",
        Feet="Nyame Sollerets"
    }
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets

	sets.Enmity = {}
	sets.Knockback = {}
	--sets.passive.Twilight = { head = "Twilight Helm", body = "Twilight Mail" }

	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {
		--sub = "Diamond Aspis",
		back = gear.da_jse_back,
		body=af.Body,
        feet=relic.Feet
	}
	sets.precast.JA['Warcry'] = {
		--sub = "Diamond Aspis",
        head=relic.Head
	}
	sets.precast.JA['Defender'] = {
		--sub = "Diamond Aspis",
		--hands="Agoge Mufflers +3"
	}
	sets.precast.JA['Aggressor'] = {
		--sub = "Diamond Aspis",
		--body="Agoge Lorica +3",
		--head="Pummeler's Mask +3"
	}
	sets.precast.JA['Mighty Strikes'] = {
		--hands="Agoge Mufflers +3"
	}
	sets.precast.JA["Warrior's Charge"] = {
		--sub = "Diamond Aspis",
		--legs={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}}
	}
	sets.precast.JA['Tomahawk'] = {
		ammo = "Thr. Tomahawk",
		feet=relic.Feet,
	}
	sets.precast.JA['Retaliation'] = {
		--sub = "Diamond Aspis",
		--feet="Boii Calligae +3",
		--hands="Pumm. Mufflers +4"
	}
	sets.precast.JA['Restraint'] = {
		--sub = "Diamond Aspis",
		hands=empy.Hands
	}
	sets.precast.JA['Blood Rage'] = {
		sub = "Diamond Aspis",
        body=empy.Body
	}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells

	sets.precast.FC = {
        ammo="Sapience Orb",
        head="Sakpata's Helm",
        body="Sakpata's Breastplate",
        hands="Leyline Gloves",
        -- legs="Arjuna Breeches",
        feet="Odyssean Greaves",
        neck="Voltsurge Torque",
        waist="Audumbla Sash",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Defending Ring",
        -- back="Solemnity Cape"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        -- ammo="Staunch Tathlum +1",
        -- legs="Jokushu Haidate",
    })

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
		-- back = "Mujin Mantle"
	 })

	sets.midcast.Cure = {}

	sets.Self_Healing = {
		-- neck = "Phalaina Locket",
		-- hands = "Buremte Gloves",
		-- ring2 = "Kunaji Ring",
		-- waist = "Gishdubar Sash"
	}
	sets.Cure_Received = {
		-- neck = "Phalaina Locket",
		-- hands = "Buremte Gloves",
		--  ring2 = "Kunaji Ring",
		-- waist = "Gishdubar Sash"
	 }

	 sets.Phalanx_Received = {
        ammo="Staunch Tathlum +1",
        head="Yorium Barbuta",
        body="Yorium Cuirass",
        hands="Souv. Handsch. +1",
        legs="Sakpata's Cuisses",
        feet="Souveran Schuhs +1",
        right_ear="Nourish. Earring +1",
        left_ring="Gelatinous Ring +1",
        --right_ring="Moonlight Ring",
    }

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
        ammo = "Knobkierrie",
        head = relic.Head,
		neck = "War. Beads +1",
        hands =	empy.Hands,
        body = af.Body,
		-- replace legs w/ nyame
		legs={ name="Valorous Hose", augments={'Accuracy+25','Weapon skill damage +3%','VIT+9','Attack+12',}},
		feet = "Sulevia's Leggings +2", -- replace w/ nyame
		waist="Sailfi Belt +1",
		left_ring="Cornelia's Ring",
		right_ring="Karieyh Ring",
        --right_ring="Sroda Ring",
		left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
		back=gear.wsd_str_jse_back,
	}

	sets.precast.WS.AttackCap = set_combine(sets.precast.WS, {
		body="Sakpata's Breastplate",
		legs = empy.Legs,
	})

	sets.precast.WS.Proc = {
		head="Souv. Schaller +1",
        body={ name="Souv. Cuirass +1", augments={'VIT+12','Attack+25','"Refresh"+3',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {
		-- back = "Letalis Mantle",
		legs="Pumm. Cuisses +3",
	})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		--neck = "Combatant's Torque",
		legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
	})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {
		--neck = "Combatant's Torque"
	})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		--head = sets.Nyame.Head,
		legs = "Boii Cuisses +3",
	})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
		--head = sets.Nyame.Head,
		legs = "Boii Cuisses +3",
	})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
		--head = sets.Nyame.Head,
		legs = "Boii Cuisses +3",
	})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
		--head = sets.Nyame.Head,
		legs = "Boii Cuisses +3",
	})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {
		--head = sets.Nyame.Head,
		legs = "Boii Cuisses +3",
	})
	sets.precast.WS['Savage Blade'].Subtle = set_combine(sets.precast.WS, {
		--body = "Dagon Breast.",
		left_ring = "Chirich Ring +1",
		--right_ring = "Chirich Ring +1",
		neck = "Bathy Choker",
	})

	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
		back = gear.wsd_vit_jse_back,
		legs = "Boii Cuisses +3",
		ring1 = "Regal Ring",
		--ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
		back = gear.wsd_vit_jse_back,
		legs = "Boii Cuisses +3",
		ring1 = "Regal Ring",
		--ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {
		back = gear.wsd_vit_jse_back,
		legs = "Boii Cuisses +3",
		ring1 = "Regal Ring",
		--ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
		back = gear.wsd_vit_jse_back,
		legs = "Boii Cuisses +3",
		ring1 = "Regal Ring",
		--ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {
		back = gear.wsd_vit_jse_back,
		legs = "Boii Cuisses +3",
		ring1 = "Regal Ring",
		--ring2 = "Niqmaddu Ring",
	})

	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo = "Coiste Bodhar",
		neck = "Fotia Gorget",
		head = "Hjarrandi Helm",
		body = "Sakpata's Plate",
		hands = "Sakpata's Gauntlets",
		legs = "Sakpata's Cuisses",
		feet = "Pumm. Calligae +4",
		belt = "Fotia Belt",
		ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Rampage'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Rampage'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Raging Rush'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Rush'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {
		--body = "Hjarrandi Breast.",
		hands = "Flam. Manopolas +2",
		legs = "Boii Cuisses +3",
		feet = "Boii Calligae +2",
	})
	sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
		body = "Hjarrandi Breast.",
		hands = "Flam. Manopolas +2",
		legs = "Boii Cuisses +3",
		feet = "Boii Calligae +2",
	})
	sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {
		body = "Hjarrandi Breast.",
		hands = "Flam. Manopolas +2",
		legs = "Boii Cuisses +3",
		feet = "Boii Calligae +2",
	})
	sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {
		body = "Hjarrandi Breast.",
		hands = "Flam. Manopolas +2",
		legs = "Boii Cuisses +3",
		feet = "Boii Calligae +2",
	})
	sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {
		body = "Hjarrandi Breast.",
		hands = "Flam. Manopolas +2",
		legs = "Boii Cuisses +3",
		feet = "Boii Calligae +2",
	})

	sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
	})
	sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
	})

	-- Swap to these on Moonshade using WS if at 3000 TP
	--sets.MaxTP = { ear1 = "Lugra Earring +1", ear2 = "Lugra Earring", }
	--sets.AccMaxTP = { ear1 = "Mache Earring +1", ear2 = "Telos Earring" }
	--sets.AccDayMaxTPWSEars = { ear1 = "Mache Earring +1", ear2 = "Telos Earring" }
	--sets.DayMaxTPWSEars = { ear1 = "Ishvara Earring", ear2 = "Brutal Earring", }
	--sets.AccDayWSEars = { ear1 = "Mache Earring +1", ear2 = "Telos Earring" }
	--sets.DayWSEars = { ear1 = "Brutal Earring", ear2 = "Moonshade Earring" }

	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		ammo="Crepuscular Pebble",
		head="Sakpata's Helm",
		--body="Sacro Breastplate",
		--body="Hjarrandi breastplate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		--legs=af.Legs,
		legs= "Sakpata's Cuisses",
		feet=af.Feet,
		neck="Loricate Torque +1",
		waist="Asklepian Belt",
		left_ear="Tuisto Earring",
		right_ear="Odnowa earring +1",
		ring2= "Murky Ring",
		ring1= "Defending Ring",
		-- ammo="Staunch Tathlum +1"
		back=gear.da_jse_back,
	}

	sets.idle.Weak = set_combine(sets.idle, { head = "Twilight Helm", body = "Twilight Mail" })

	sets.idle.Reraise = set_combine(sets.idle, { head = "Twilight Helm", body = "Twilight Mail" })

	-- Defense sets
	sets.defense.PDT = {
		-- ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		waist="Plat. Mog. Belt",
		-- legs="Pumm. Cuisses +4",
		-- feet="Pumm. Calligae +4",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		-- waist="Ioskeha Belt +1",
		-- left_ear="Telos Earring",
		-- right_ear="Dedition Earring",
		ring1="Flamma Ring",
		ring2="Gelatinous Ring +1",
		-- right_ring="Defending Ring",
		back=gear.da_jse_back,
	}

	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {
		head = "Twilight Helm",
		body = "Twilight Mail"
	 })

	sets.defense.MDT =  set_combine(sets.defense.PDT, {
		earring1 = "Odnowa Earring +1",
		ring2 = "Fortified Ring"
	})

	sets.defense.MDTReraise = set_combine(sets.defense.MDT, { head = "Twilight Helm", body = "Twilight Mail" })

	sets.defense.MEVA = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Warder's Charm +1",
		ear1 = "Genmei Earring",
		ear2 = "Ethereal Earring",
		body = "Tartarus Platemail",
		hands = "Sulev. Gauntlets +2",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Moonlight Ring",
		back = "Moonlight Cape",
		waist = "Flume Belt +1",
		legs = "Sulev. Cuisses +2",
		feet = "Amm Greaves"
	}

	sets.Skillchain = {
		neck = "Warder Charm +1",
	}

	sets.Kiting = {
		ring1 = "Shneddick ring",
	}
	sets.Reraise = { head = "Twilight Helm", body = "Twilight Mail" }
	sets.buff.Doom =  {
	neck = "Nicander's necklace",
	right_ring= "Purity ring"
	}

	-- Engaged sets
	sets.engaged = {
		ammo="Coiste Bodhar",
		--head = empy.Head, -- only need +2
		head = "Sakpata's Helm",
		neck = "War. Beads +1",
		body = "Hjarrandi breastplate",
		hands="Sakpata's Gauntlets",
		--legs="Pumm. Cuisses +3",
		legs="Sakpata's cuisses",
		--feet="Pumm. Calligae +3",
		feet="Sakpata's Leggings",
		--waist="Sailfi Belt +1",
		waist="Eschan Stone",
		--right_ear="Boii Earring +1",
		--left_ear="Schere Earring",
		left_ear="Zwazo Earring +1",
		right_ear="Brutal Earring",
		--left_ring="Moonlight Ring",
		left_ring="Chirich ring +1",
		--right_ring="Niqmaddu Ring",
		right_ring = "Defending Ring",
		back=gear.da_jse_back,
	}

	sets.engaged.SomeAcc = set_combine(sets.engaged, {
		hands="Boii mufflers +2",
		ammo="Amar cluster",
		waist="Eschan stone",
    })
	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {
		hands="Boii mufflers +2",
		ammo="Amar cluster",
		waist="Eschan stone",
    })
	sets.engaged.FullAcc = set_combine(sets.engaged.Acc, {
    })
	sets.engaged.Fodder = set_combine(sets.engaged, {
    })

	-- Engaged sets
	sets.engaged.Subtle = set_combine(sets.engaged, {
		--body = "Dagon Breast.",
		left_ring = "Chirich Ring +1",
		--right_ring = "Chirich Ring +1",
		legs = "Sakpata's Cuisses",
		feet = "Sakpata's Leggings"
    })


end


	--------------------------------------
	-- Start defining the sets
	--------------------------------------







autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MeleeClubs']='Realmrazer',
     ['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade'}

     -- Global toggles for the automation feature
auto_ws_active = false
target_weapon_skill = "Savage Blade" -- Change this to your preferred weapon skill

-- Command handler to turn it on/off via the chat box
function self_command(command)
    if command:lower() == 'toggle autows' then
        auto_ws_active = not auto_ws_active
        windower.add_to_chat(122, '--- Auto Weaponskill is now ' .. (auto_ws_active and 'ON' or 'OFF') .. ' ---')
    end
end

-- Event listener that triggers every time your TP updates
windower.register_event('tp change', function(new_tp, old_tp)
    -- Check if feature is on, character is engaged in combat, and not afflicted with amnesia
    if auto_ws_active and player.status == 'Engaged' and not buffactive['amnesia'] then
        -- Execute the weapon skill as soon as you hit 1000 TP or higher
        if new_tp >= 1000 then
            windower.send_command('input /ws "' .. target_weapon_skill .. '" <t>')
        end
    end
end)
