function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options("Normal", "Acc", "FullAcc", "DT")
	state.HybridMode:options("Normal", "DT")
	state.WeaponskillMode:options("Match", "Acc", "Proc")
	state.AutoBuffMode:options("Off", "Auto", "AutoMelee", "FullMeleeBuff")
	state.CastingMode:options("Normal", "OccultAcumen", "Resistant", "Fodder", "Proc", "Enmity")
	state.IdleMode:options("Normal", "PDT", "MDT", "DTHippo", "Aminon")
	state.PhysicalDefenseMode:options("PDT", "NukeLock")
	state.MagicalDefenseMode:options("MDT")
	state.ResistDefenseMode:options("MEVA")
	state.Weapons:options(
		"None",
		"Naegling",
		"Tauret",
		"Club",
		"DualClubs",
		"DualWeapons",
		"DualwBow",
		"ExDual",
		"Dual1DMG",
		"Enspell",
		"EnspellDW",
		"RedLotusBlade",
		"SeraphBlade",
		"DualAeolian",
		"Chaos"
	)
	state.ConvertMode = M {"Always", "300", "1000", "Never"}

	gear.nuke_jse_back = {
		name = "Sucellos's Cape",
		augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}
	}

	-- Additional local binds
	send_command("bind ^` gs c cycle ElementalMode")
	send_command("bind !` gs c cycle MagicBurstMode")
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command("bind @f8 gs c toggle AutoNukeMode")
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command("bind @f10 gs c cycle RecoverMode")
	send_command(
		"bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false; gs c set weapons none"
	)
	send_command("bind ^q gs c set weapons DualWeapons")
	send_command("bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons dualweapons")
	send_command("bind !q gs c set weapons DualClubs")
	send_command("bind !f7 gs c cycle ConvertMode")
	
	send_command('bind ^@!insert input //sm all follow')
	send_command('bind ^@!home input //sm mirror')
	send_command('bind ^@!pageup input //send Darkonyx //sm start')
	send_command('bind ^@!pagedown input //send Mydriatictofu //sm start')
	send_command('bind ^@!end input //send Darkonyx //sm stop')
	send_command('bind ^@!delete input //send Mydriatictofu //sm stop')

	select_default_macro_book()
end

function init_gear_sets()
	-- JSE
	AF = {} -- leave this empty
	RELIC = {} -- leave this empty
	EMPY = {} -- leave this empty
	Chiro = {} -- leave this empty
	Carm = {} -- leave this empty
	Jhakri = {} -- leave this empty

	-- Fill this with your own JSE.
	--Atrophy
	AF.Head = "Atrophy Chapeau +2"
	AF.Body = "Atrophy Tabard +3"
	AF.Hands = "Atrophy Gloves +3"
	AF.Legs = "Atrophy Tights +2"
	AF.Feet = "Atrophy Boots"

	--Vitiation
	RELIC.Head = "Viti. Chapeau +3"
	RELIC.Body = "Viti. Tabard +3"
	RELIC.Hands = "Viti. Gloves +2"
	RELIC.Legs = "Viti. Tights +3"
	RELIC.Feet = "Vitiation Boots +3"

	--Lethargy 
	EMPY.Head = "Lethargy chappel +3"
	EMPY.Body = "Lethargy Sayon +3"
	EMPY.Hands = "Lethargy Gantherots +3"
	EMPY.Legs = "Lethargy Fuseau +3"
	EMPY.Feet = "Lethargy Houseaux +3"

	--  
	Carm.Legs = {}
	Carm.Legs.D = {name = "Carmine Cuisses +1"}

	--Chironic
	Chiro.Legs = {}
	Chiro.Legs.MACC = "Chironic Hose"

	Jhakri = {
		Head = "Jhakri Coronal +2",
		Body = "Jhakri Robe +2",
		Hands = "Jhakri Cuffs +2",
		Legs = "Jhakri Slops +2",
		Feet = "Jhakri Pigaches +2",
		Ring1 = "Jhakri Ring"
	}

	-- Capes:
	-- Sucellos's And such, add your own.
	RDMCape = {}
	--RDMCape.TP = {
		--name = "Sucellos's Cape",
		--augments = {"DEX+20", "Accuracy+20 Attack+20", "Accuracy+10", '"Store TP"+10', "Phys. dmg. taken-10%"}
	--}
	--RDMCape.DW = {
		--name = "Sucellos's Cape",
		---augments = {"DEX+20", "Accuracy+20 Attack+20", "Accuracy+10", '"Dual Wield"+10', "Phys. dmg. taken-10%"}
	--}
	RDMCape.MACC = {
		name = "Sucellos's Cape",
		augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Cure" potency +10%','Phys. dmg. taken-10%'}
	}
	RDMCape.FC = {
		name = "Sucellos's Cape",
		augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10'}
	}
	RDMCape.STRWSD = {
		name = "Sucellos's Cape",
		augments = {"STR+20", "Accuracy+20 Attack+20", "STR+5", "Weapon skill damage +10%", "Phys. dmg. taken-10%"}
	}
	--RDMCape.DEXWSD = {
		--name = "Sucellos's Cape",
		--augments = {"DEX+20", "Accuracy+20 Attack+20", "DEX+10", "Weapon skill damage +10%", "Phys. dmg. taken-10%"}
	--}

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	sets.enmity = {
		head = "Halitus Helm",
		hands = "Merlinic Dastanas",
		back = "Agema Cape",
		neck = "Warder's Charm +1",
		ring1 = "Petrov Ring",
		ring2 = "Provocare Ring"
	}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA["Chainspell"] = {body = RELIC.Body}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz["Healing Waltz"] = {}

	sets.precast.RA = {}

	-- Fast cast sets for spells

	sets.precast.FC = {
		neck = "Loricate Torque +1",
		head = AF.Head, -- 12
		body = RELIC.Body, -- 14
		hands = "Nyame gauntlets",
		legs = "Nyame flanchard",
		feet = "Nyame sollerets",
		waist = "Witful Belt", -- 3
		left_ear = "Malignance Earring", -- 4
		right_ear = "Lethargy earring", -- 7
		left_ring = "Defending Ring",
		right_ring = "Prolix ring", -- 2
		-- back = "Perimede Cape",
		back = RDMCape.FC, -- 10
		ammo = "Sapience orb", --2 
		range = empty
		--Total: 45 gear + 38 job
	}

	-- Curing Precast, Cure Spell Casting time -
	sets.precast.FC.Cure =
		set_combine(
		sets.precast.FC,
		{
			right_ear = "Mendi. Earring",
			waist = "Plat. Mog. Belt"
			--Total: 44 gear + 38 job
		}
	)
	sets.precast.FC.Impact =
		set_combine(
		sets.precast.FC,
		{
			head = empty,
			--body = "Crepuscular Cloak"
		}
	)
	sets.precast.FC.Dispelga =
		set_combine(
		sets.precast.FC,
		{
			main = "Daybreak",
			sub = "Ammurapi Shield"
		}
	)

	-- Absorb TP set- Haste 25% and FC 42 Gear + 38 Job Traits = 80%
	sets.precast.FC.Absorb = {
		main = "Maxentius",
		sub = "Ammurapi Shield",
		ammo = "Hydrocera",
		head = AF.Head, -- 16 FC
		body = EMPY.Body,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet, 
		neck = "Duelist's torque +1",
		waist = "Luminary sash",
		left_ear = "Malignance Earring", -- 4 FC
		right_ear = {
			name = "Lethargy Earring",
			augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}
		}, -- 8 FC
		left_ring = {name = "Metamor. Ring +1", augments = {"Path: A"}},
		right_ring = "Kishar Ring", -- 4 FC
		back = RDMCape.FC -- 10 FC
	}

	sets.precast.FC.Stun = set_combine(sets.precast.FC.Absorb)

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head = "Nyame helm",
		ammo = "Oshasha's Treatise",
		neck = "Rep. Plat. Medal",
		body = "Nyame mail",
		-- hands = sets.Nyame.Hands,
		hands = AF.Hands,
		legs = "Nyame flanchard" ,
		feet = EMPY.Feet,
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear = "Ishvara earring",
		--left_ear = "Sherida Earring",
		right_ear = {name = "Moonshade Earring", augments = {"Accuracy+4", "TP Bonus +250"}},
		left_ring = "Cornelia's ring",
		right_ring = "Karieyh Ring",
		back = RDMCape.STRWSD
	}

	sets.precast.WS.Proc = {
		range = empty,
		ammo = "Hasty Pinion +1",
		--head = sets.Malignance.Head,
		neck = "Combatant's Torque",
		ear1 = "Mache Earring +1",
		ear2 = "Telos Earring",
		--body = sets.Malignance.Body,
		--hands = sets.Malignance.Hands,
		ring1 = "Ramuh Ring +1",
		ring2 = "Ramuh Ring +1",
		back = RDMCape.TP,
		waist = "Olseni Belt",
		--legs = sets.Malignance.Legs,
		--feet = sets.Malignance.Feet
	}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Requiescat"] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Chant Du Cygne"] =
		set_combine(
		sets.precast.WS,
		{
			range = empty,
			ammo = "Coiste Bodhar",
			head = "Malignance chapeau",
			--neck = "Fotia Gorget",
			body = EMPY.Body,
			ear1 = "Sherida Earring",
			ear2 = "Lethargy Earring",
			--hands = sets.Malignance.Hands,
			-- ring1 = "Begrudging Ring",
			ring1 = "Karieyh Ring",
			ring2 = "Ilabrat Ring",
			back = RDMCape.STRWSD,
			--waist = "Fotia Belt"
		}
	)
	sets.precast.WS["Evisceration"] = sets.precast.WS["Chant Du Cygne"]

	sets.precast.WS["Ruthless Stroke"] =
		set_combine(
		sets.precast.WS,
		{
			right_ear = "Dominance Earring +1",
			waist = {name = "Kentarch Belt +1", augments = {"Path: A"}},
			ammo = "Crepuscular Pebble",
			back = RDMCape.DEXWSD
		}
	)

	sets.precast.WS["Savage Blade"] =
		set_combine(
		sets.precast.WS,
		{
			right_ring = "Sroda Ring"
		}
	)

	sets.precast.WS["Fast Blade II"] =
		set_combine(
		sets.precast.WS,
		{
			neck = "Fotia Gorget",
			ammo = "Coiste Bodhar",
			ear1 = "Sherida Earring",
			ear2 = "Lethargy Earring",
			waist = "Fotia Belt",
			back = RDMCape.DEXWSD
		}
	)

	sets.precast.WS["Black Halo"] = set_combine(sets.precast.WS["Savage Blade"], {})

	sets.precast.WS["Black Halo"].Acc =
		set_combine(
		sets.precast.WS["Black Halo"],
		{
			right_ear = "Dominance Earring +1"
		}
	)

	sets.precast.WS["Sanguine Blade"] =
		set_combine(
		sets.precast.WS,
		{
			ammo = {name = "Ghastly Tathlum +1", augments = {"Path: A"}},
			head = "Pixie Hairpin +1",
			neck = "Sibyl Scarf",
			hands = "Jhakri Cuffs +2",
			feet = EMPY.Feet,
			right_ear = "Malignance Earring",
			right_ring = "Archon Ring",
			waist = "Orpheus's Sash",
			back = RDMCape.STRWSD
		}
	)

	sets.precast.WS["Seraph Blade"] =
		set_combine(
		sets.precast.WS,
		{
			ammo = {name = "Ghastly Tathlum +1", augments = {"Path: A"}},
			neck = "Sibyl Scarf",
			hands = "Jhakri Cuffs +2",
			feet = EMPY.Feet,
			right_ear = "Malignance Earring",
			waist = "Orpheus's Sash",
			back = RDMCape.STRWSD
		}
	)

	sets.precast.WS["Empyreal Arrow"] =
		set_combine(
		sets.precast.WS,
		{
			ammo="Homiliary",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Nyame Gauntlets",
			legs="Malignance Tights",
			feet="Nyame Sollerets",
			neck="Marked Gorget",
			waist="Eschan Stone",
			left_ear="Telos Earring",
			right_ear="Crep. Earring",
			left_ring="Cacoethic Ring",
			right_ring="Karieyh Ring",
			back="Sokolski Mantle"
					}
	)

	sets.precast.WS["Red Lotus Blade"] =
		set_combine(
		sets.precast.WS,
		{
			ammo = {name = "Ghastly Tathlum +1", augments = {"Path: A"}},
			neck = "Sibyl Scarf",
			hands = "Jhakri Cuffs +2",
			feet = EMPY.Feet,
			right_ear = "Malignance Earring",
			waist = "Orpheus's Sash",
			back = RDMCape.STRWSD
		}
	)

	sets.precast.WS["Aeolian Edge"] =
		set_combine(
		sets.precast.WS,
		{
			ammo = {name = "Ghastly Tathlum +1", augments = {"Path: A"}},
			neck = "Sibyl Scarf",
			hands = "Jhakri Cuffs +2",
			feet = EMPY.Feet,
			right_ear = "Malignance Earring",
			waist = "Orpheus's Sash",
			back = RDMCape.STRWSD
		}
	)

	-- Midcast Sets

	-- Gear that converts elemental damage done to recover MP.
	sets.RecoverMP = {body = "Seidr Cotehardie"}

	-- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
	sets.midcast.Casting = {
		neck = "Dls. Torque +1",
		back = RDMCape.MACC,
		body = EMPY.Body,
		head = EMPY.Head,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		left_ear = "Malignance Earring",
		right_ear = "Snotra Earring",
		waist = "Null Belt",
		ammo = "Regal Gem",
		left_ring = {name = "Metamor. Ring +1", augments = {"Path: A"}},
		right_ring = "Freke Ring"
		-- left_ear	=	"Friomisi Earring",
		-- right_ear	=	"Enchntr. Earring +1",
	}

	sets.midcast.FastRecast = {
		--main = gear.grioavolr_fc_staff,
		--sub = "Clerisy Strap +1",
		--ammo = "Hasty Pinion +1",
		head = AF.Head,
		neck = "Baeytl Pendant",
		left_ear = "Enchntr. Earring +1",
		right_ear = "Malignance Earring",
		--body = "Zendik Robe",
		hands = "Gende. Gages +1",
		ring1 = "Prolix Ring",
		ring2 = "Kishar Ring",
		back = RDMCape.FC,
		waist = "Witful Belt",
		--legs = "Psycloth Lappas",
		--feet = "Medium's Sabots"
	}

	sets.midcast.Absorb = {
		ammo = "Regal Gem",
		head = AF.Head, -- 16
		body = RELIC.Body, -- 15
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		neck = "Null Loop",
		waist = "Sailfi Belt +1",
		--left_ear = "Regal Earring",
		right_ear = "Lethargy Earring +1", -- 8
		left_ring = {name = "Metamor. Ring +1", augments = {"Path: A"}},
		right_ring = "Stikini Ring +1",
		back = RDMCape.FC -- 10
	}

	sets.midcast.Cure =
		set_combine(
		sets.midcast.Casting,
		{
			main="Daybreak",
            sub="Ammurapi Shield",
            ammo="Homiliary",
            head={ name="Kaykaus Mitra", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
            body="Bunzi's Robe",
            hands="Leth. Ganth. +2",
            legs={ name="Viti. Tights +2", augments={'Enspell Damage','Accuracy',}},
            feet="Bunzi's Sabots",
            neck="Loricate torque +1",
            waist="Plat. Mog. Belt",
            left_ear="Ethereal Earring",
            right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
            left_ring="Murky ring",
            right_ring="Defending Ring",
            back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
		}
	)

	sets.midcast.LightWeatherCure = {
			main="Daybreak",
            sub="Ammurapi Shield",
            ammo="Homiliary",
            head={ name="Kaykaus Mitra", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
            body="Bunzi's Robe",
            hands="Leth. Ganth. +2",
            legs={ name="Viti. Tights +2", augments={'Enspell Damage','Accuracy',}},
            feet="Bunzi's Sabots",
            neck="Twilight Torque",
            waist="Plat. Mog. Belt",
            left_ear="Ethereal Earring",
            right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
            left_ring="Gelatinous Ring +1",
            right_ring="Defending Ring",
            back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
	}

	--Cureset for if it's not light weather but is light day.
	sets.midcast.LightDayCure = {
			main="Daybreak",
            sub="Ammurapi Shield",
            ammo="Homiliary",
            head={ name="Kaykaus Mitra", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
            body="Bunzi's Robe",
            hands="Leth. Ganth. +2",
            legs={ name="Viti. Tights +2", augments={'Enspell Damage','Accuracy',}},
            feet="Bunzi's Sabots",
            neck="Twilight Torque",
            waist="Plat. Mog. Belt",
            left_ear="Ethereal Earring",
            right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
            left_ring="Gelatinous Ring +1",
            right_ring="Defending Ring",
            back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
	}

	sets.midcast.Cursna = {
		--main = gear.grioavolr_fc_staff,
		--sub = "Curatio Grip",
		ammo = "Staunch Tathlum +1",
		head = "Bunzi's Hat",
		neck = "Malison Medallion",
		--ear1 = "Meili Earring",
		ear2 = "Mendi. Earring",
		body = RELIC.Body,
		--hands = "Hieros Mittens",
		--ring1 = "Haoma's Ring",
		ring2 = "Menelaus's Ring",
		--back = "Oretan. Cape +1",
		waist = "Witful Belt",
		legs = "Carmine Cuisses +1",
		feet = "Vanya Clogs"
	}

	sets.midcast.StatusRemoval =
		set_combine(
		sets.midcast.FastRecast,
		{
			--main = gear.grioavolr_fc_staff,
			--sub = "Clemency Grip"
		}
	)

	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {
		neck = "Phalaina Locket",
		ear1 = "Etiolation Earring",
		ring2 = "Kunaji Ring",
		waist = "Gishdubar Sash"
	}
	sets.Cure_Received = {
		--neck = "Phalaina Locket",
		--ring2 = "Kunaji Ring",
		--waist = "Gishdubar Sash"
	}
	sets.Self_Refresh = {back = "Grapevine Cape", waist = "Gishdubar Sash"}

	sets.Phalanx_Received = {
		main = "Sakpata's Sword",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','Phalanx +2',}},
		body={ name="Taeon Tabard", augments={'Accuracy+15 Attack+15','"Dual Wield"+5','Phalanx +2',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +2',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Accuracy+18','"Dual Wield"+4','Phalanx +2',}}, 
	}

	sets.Self_Phalanx = {
		main = "Daybreak",
		sub = " Ammurapi Shield",
		ammo = "Sapience Orb",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','Phalanx +2',}},
		body={ name="Taeon Tabard", augments={'Accuracy+15 Attack+15','"Dual Wield"+5','Phalanx +2',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +2',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Accuracy+18','"Dual Wield"+4','Phalanx +2',}}, 
		neck = {name = "Dls. Torque +1", augments = {"Path: A"}},
		waist = "Embla Sash",
		left_ear = "Malignance Earring",
		right_ear = "Lethargy Earring +1",
		ring1 = {name = "Stikini Ring +1", bag = "wardrobe1"},
		ring2 = {name = "Stikini Ring +1", bag = "wardrobe2"},
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
	}

	sets.midcast["Enhancing Magic"] = {
		main={ name="Colada", augments={'Enh. Mag. eff. dur. +3','MND+1','Mag. Acc.+10','DMG:+9',}},
		sub = "Ammurapi Shield",
		ammo = "Sapience Orb",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}}, 
		neck = "Dls. Torque +1",
		--ear1 = "Andoaa Earring",
		right_ear = "Lethargy Earring +1",
		body = RELIC.Body,
		hands = AF.Hands,
		--ring1 = {name = "Stikini Ring +1", bag = "wardrobe2"},
		ring2 = "Murky ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
		waist = "Embla Sash",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet = EMPY.Feet, 
	}

	sets.midcast.Phalanx =
		set_combine(
		sets.midcast["Enhancing Magic"],
		{
			main = "Sakpata's Sword",
			sub = "Ammurapi Shield",
			--head = gear.taeon_phalanx_head,
			--body = gear.taeon_phalanx_body,
			--hands = gear.taeon_phalanx_hands,
			--legs = gear.taeon_phalanx_legs,
			--feet = gear.taeon_phalanx_feet
		}
	)

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.
	sets.buff.ComposureOther = {
		head = EMPY.Head,
		body = EMPY.Body,
		hands = AF.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet
	}

	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
		--main = "Pukulatmuj +1",
		--sub = "Forfend +1",
		--head = "Befouled Crown",
		--neck = "Incanter's Torque",
		hands = RELIC.Hands,
		legs = AF.Legs,
		--ear1 = "Andoaa Earring",
		--ear2 = "Mimir Earring",
		--ring1 = {name = "Stikini Ring +1", bag = "wardrobe1"},
		--ring2 = {name = "Stikini Ring +1", bag = "wardrobe2"},
		--waist = "Olympus Sash",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}},
	}
	sets.midcast.Refresh = {head = "Amalric Coif +1", body = AF.Body, legs = EMPY.Legs}
	sets.midcast.Regen = {
		--main = "Bolelabunga",
		feet = "Bunzi's Sabots"
	}
	sets.midcast.Aquaveil = {
		head = "Amalric Coif +1",
		hands = "Regal Cuffs",
		--waist = "Emphatikos Rope",
		legs = "Shedir Seraweels"
	}
	sets.midcast.BarElement = {
		neck = "Sroda Necklace",
		legs = "Shedir Seraweels"
	}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {})
	sets.midcast.BoostStat = {hands = AF.Hands}
	sets.midcast.Stoneskin = {
		--neck = "Nodens Gorget",
		--ear2 = "Earthcry Earring",
		waist = "Siegel Sash",
		legs = "Shedir Seraweels"
	}
	sets.midcast.Protect = {ring2 = "Sheltered Ring"}
	sets.midcast.Shell = {ring2 = "Sheltered Ring"}

	sets.midcast["Enfeebling Magic"] = {
		main = "Crocea Mors",
		sub = "Ammurapi Shield",
		ammo = "Regal Gem",
		--ammo = "Hydrocera",
		neck = "Dls. Torque +1",
		head = RELIC.Head,
		body = EMPY.Body,
		hands = "Regal Cuffs",
		--hands = AF.Hands,
		legs = "Chironic Hose",
		feet = RELIC.Feet,
		waist = "Luminary sash",
		left_ring = "Metamor. Ring +1",
		right_ring = "Kishar Ring",
		left_ear = "Snotra Earring",
		right_ear = "Malignance earring",
		back = RDMCape.MACC
	}

	sets.midcast["Enfeebling Magic"].Resistant =
		set_combine(
		sets.midcast["Enfeebling Magic"],
		{
			main = "Crocea Mors",
			sub = "Ammurapi Shield",
			head = AF.Head,
			neck = "Duelist's torque +1",
			--ear1 = "Regal Earring",
			ear1 = "Malignance earring",
			hands = EMPY.Hands,
			waist = "Eschan stone",
			left_ring = "Metamor. Ring +1",
			right_ring = "Stikini Ring +1",
		}
	)

	sets.midcast.DurationOnlyEnfeebling =
		set_combine(
		sets.midcast["Enfeebling Magic"],
		{
			main = "Bunzi's Rod",
			sub = "Ammurapi Shield",
			hands = "Regal Cuffs",
			body = EMPY.Body,
			left_ear = "Snotra Earring",
			ring2 = "Kishar Ring",
			waist = "Obstinate Sash",
			feet = EMPY.Feet
		}
	)

	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast["Enfeebling Magic"].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling, {waist = "Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast["Enfeebling Magic"].Resistant, {waist = "Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling, {waist = "Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast["Enfeebling Magic"].Resistant, {waist = "Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling, {waist = "Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast["Enfeebling Magic"].Resistant, {waist = "Acuity Belt +1"})
	sets.midcast.Foil = sets.enmity
	sets.midcast.Flash = sets.enmity

	sets.midcast.Dispel = sets.midcast["Enfeebling Magic"].Resistant

	sets.midcast.SkillBasedEnfeebling =
		set_combine(
		sets.midcast["Enfeebling Magic"],
		{
			ear1 = "Regal Earring",
			--ear2 = "Vor Earring",
			hands = EMPY.Hands,
			body = AF.Body,
			waist = "Obstin. Sash",
			left_ring = "Metamor. Ring +1",
			right_ring = "Stikini Ring +1"
		}
	)

	sets.midcast["Frazzle II"] =
		set_combine(
		sets.midcast["Enfeebling Magic"].Resistant,
		{
			neck = "Null Loop"
			--neck = "Duelist's torque +1",
			
		}
	)
	sets.midcast["Frazzle III"] =
		set_combine(
		sets.midcast.SkillBasedEnfeebling,
		{
			ear1 = "Snotra Earring",
			ring1 = "Kishar Ring",
			body = EMPY.Body,
			hands = EMPY.Hands,
			legs = EMPY.Legs
		}
	)
	sets.midcast["Frazzle III"].Resistant = sets.midcast["Enfeebling Magic"].Resistant

	sets.midcast["Distract III"] = sets.midcast.SkillBasedEnfeebling
	sets.midcast["Distract III"].Resistant = sets.midcast["Enfeebling Magic"].Resistant

	sets.midcast["Divine Magic"] = set_combine(sets.midcast["Enfeebling Magic"].Resistant, {})

	sets.midcast.Dia =
		set_combine(
		sets.midcast["Enfeebling Magic"],
		{
			waist = "Obstinate Sash"
		}
	)
	sets.midcast.Diaga = sets.midcast.Dia

	sets.midcast.Bio = set_combine(sets.midcast["Enfeebling Magic"], sets.TreasureHunter)

	sets.midcast["Elemental Magic"] = {
		main = "Bunzi's Rod",
		sub = "Ammurapi Shield",
		ammo = {name = "Ghastly Tathlum +1", augments = {"Path: A"}},
		--ammo = "Ghastly Tathlum",
		--ammo = "Witchstone",
		head = EMPY.Head,
		body = EMPY.Body,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		neck = "Sibyl Scarf",
		waist = "Eschan stone",
		left_ear = "Malignance Earring",
		--right_ear = "Regal Earring",
		right_ear = "Friomisi earring",
		left_ring = "Jhakri ring",
		right_ring = "Freke Ring",
		back = RDMCape.FC
	}

	sets.midcast["Elemental Magic"].Resistant = set_combine(sets.midcast["Elemental Magic"], {})
	sets.midcast["Elemental Magic"].Fodder = set_combine(sets.midcast["Elemental Magic"], {})

	sets.midcast["Elemental Magic"].Proc = {
		main = empty,
		sub = empty,
		range = empty,
		--ammo = "Impatiens",
		--head = "Vanya Hood",
		--neck = "Baeytl Pendant",
		--ear1 = "Enchntr. Earring +1",
		ear2 = "Loquac. Earring",
		--body = "Zendik Robe",
		--hands = "Gende. Gages +1",
		ring1 = "Prolix Ring",
		ring2 = "Kishar Ring",
		--back = "Swith Cape +1",
		waist = "Witful Belt",
		--legs = "Psycloth Lappas",
		--feet = "Regal Pumps +1"
	}

	sets.midcast["Blizzard V"] = sets.midcast["Elemental Magic"]
	sets.midcast["Thunder V"] = sets.midcast["Elemental Magic"]

	sets.midcast["Elemental Magic"].HighTierNuke =
		set_combine(
		sets.midcast["Elemental Magic"],
		{head = gear.merlinic_nuke_head, ammo = "Pemphredo Tathlum", ear1 = "Regal Earring", ring1 = "Metamor. Ring +1"}
	)
	sets.midcast["Elemental Magic"].HighTierNuke.Resistant =
		set_combine(
		sets.midcast["Elemental Magic"].Resistant,
		{head = gear.merlinic_nuke_head, ear1 = "Regal Earring", ring1 = "Metamor. Ring +1"}
	)
	sets.midcast["Elemental Magic"].HighTierNuke.Fodder =
		set_combine(
		sets.midcast["Elemental Magic"].Fodder,
		{head = gear.merlinic_nuke_head, ammo = "Pemphredo Tathlum", ear1 = "Regal Earring", ring1 = "Metamor. Ring +1"}
	)

	-- Gear for Magic Burst mode.
	sets.MagicBurst =
		set_combine(
		sets.midcast["Elemental Magic"],
		{
			main = "Bunzi's Rod",
			sub = "Daybreak", 
			shield = "Ammurapi Shield",
			head = "Ea Hat",
			hands = "Bunzi's Gloves",
			body = "Ea Houppelande",
			ammo = "Ghastly Tathlum +1",
			--ammo = "Ghastly Tathlum",
			feet = EMPY.Feet
		}
	)

	sets.midcast.Impact =
		set_combine(
		sets.midcast["Elemental Magic"],
		{
			-- range = "Ullr",
			-- ammo = empty,
			head = empty,
			--body = "Crepuscular Cloak",
			hands = EMPY.Hands,
			legs = EMPY.Legs,
			feet = EMPY.Feet,
			neck = "Dls. Torque +1",
			back = "Aurist's Cape +1",
			ring1 = "Metamor. Ring +1",
			--ring2 = {name = "Stikini Ring +1", bag = "wardrobe2"}
		}
	)

	sets.midcast.Impact.OccultAcumen =
		set_combine(
		sets.midcast.Impact,
		{
			main = "Maxentius",
			sub = "Ammurapi Shield",
			ammo = "Aurgelmir Orb +1",
			body = "Crepuscular Cloak",
			hands = {name = "Merlinic Dastanas", augments = {'"Occult Acumen"+11', "INT+9"}},
			legs = "Perdition Slops",
			feet = {name = "Merlinic Crackows", augments = {'"Occult Acumen"+11', "MND+9"}},
			neck = "Anu Torque",
			waist = "Oneiros Rope",
			left_ear = "Sherida Earring",
			right_ear = "Dedition Earring",
			left_ring = "Chirich Ring +1",
			right_ring = "Chirich Ring +1",
			back = RDMCape.TP
		}
	)

	sets.midcast["Blizzard V"].OccultAcumen = {
		sub = "Ammurapi Shield",
		--ammo = "Aurgelmir Orb +1",
		--head = {name = "Merlinic Hood", augments = {'"Mag.Atk.Bns."+19', '"Occult Acumen"+11', "VIT+7", "Mag. Acc.+14"}},
		--body = {name = "Merlinic Jubbah", augments = {'"Occult Acumen"+11', "INT+9"}},
		--hands = {name = "Merlinic Dastanas", augments = {'"Occult Acumen"+11', "INT+9"}},
		--legs = "Perdition Slops",
		--feet = {name = "Merlinic Crackows", augments = {'"Occult Acumen"+11', "MND+9"}},
		neck = "Anu Torque",
		--waist = "Oneiros Rope",
		left_ear = "Sherida Earring",
		right_ear = "Dedition Earring",
		left_ring = "Chirich Ring +1",
		--right_ring = "Chirich Ring +1",
		back = RDMCape.TP
	}
	sets.midcast["Thunder V"].OccultAcumen = sets.midcast["Blizzard V"].OccultAcumen

	sets.midcast["Dark Magic"] =
		set_combine(
		sets.midcast["Enfeebling Magic"].Resistant,
		{
			main = "Rubicundity",
			sub = "Ammurapi Shield",
			neck = "Erra Pendant",
			--ear1 = "Regal Earring",
			ear2 = "Malignance Earring",
			back = RDMCape.FC
		}
	)

	sets.midcast.Drain =
		set_combine(
		sets.midcast["Dark Magic"],
		{
			main = "Rubicundity",
			sub = "Ammurapi Shield",
			ammo = "Regal Gem",
			--head = "Pixie Hairpin +1",
			ring1 = "Evanescence Ring",
			--ring2 = "Archon Ring",
			waist = "Fucho-no-obi",
			feet = "Merlinic Crackows"
		}
	)

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun =
		set_combine(
		sets.midcast["Dark Magic"],
		{
			main = "Bunzi's Rod",
			sub = "Ammurapi Shield", 
			-- ammo = empty,
			-- head = AF.Head,
			-- body = "Zendik Robe",
			-- hands = "Volte Gloves",
			ring1 = "Metamor. Ring +1",
			-- ring2 = "Stikini Ring +1",
			-- back = gear.nuke_jse_back,
			legs = "Chironic Hose",
		}
	)

	sets.midcast.Stun.Resistant =
		set_combine(
		sets.midcast.Stun,
		{
			main = "Bunzi's Rod",
			sub = "Ammurapi Shield",
			head = AF.Head,
			body = AF.Body,
			--hands = "Volte Gloves"
		}
	)

	-- Sets for special buff conditions on spells.

	sets.buff.Saboteur = {hands = EMPY.Hands}

	sets.HPDown = {
		head = "Pixie Hairpin +1",
		ear1 = "Mendicant's Earring",
		ear2 = "Evans Earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Mephitas's Ring +1",
		ring2 = "Mephitas's Ring",
		back = "Swith Cape +1",
		legs = "Shedir Seraweels",
		feet = "Jhakri Pigaches +2"
	}

	sets.HPCure = {
		main = "Daybreak",
		sub = "Sors Shield",
		range = empty,
		-- ammo = "Hasty Pinion +1",
		head = "Gende. Caubeen +1",
		neck = "Unmoving Collar +1",
		ear1 = "Gifted Earring",
		ear2 = "Mendi. Earring",
		body = RELIC.Body,
		hands = "Kaykaus Cuffs",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Meridian Ring",
		back = "Moonlight Cape",
		waist = "Luminary Sash",
		legs = "Carmine Cuisses +1",
		feet = "Kaykaus Boots"
	}

	sets.buff.Doom =  {
	neck = "Nicander's necklace",
	right_ring= "Purity ring"
	}

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {
		--main = "Chatoyant Staff",
		--sub = "Oneiros Grip",
		range = empty,
		ammo = "Impatiens",
		head = RELIC.Head,
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Jhakri Robe +2",
		--hands = gear.merlinic_refresh_hands,
		ring1 = "Defending Ring",
		--ring2 = "Sheltered Ring",
		back = "Umbra Cape",
		waist = "Flume Belt +1",
		--legs = "Lengo Pants",
		--feet = gear.chironic_refresh_feet
	}

	--   sets
	sets.idle = { 
		main={ name="Colada", augments={'"Refresh"+2','STR+6','Mag. Acc.+20','"Mag.Atk.Bns."+6'}},
		sum= "Ammurapi Shield",
		ammo = "Homiliary",
		head = RELIC.Head,
		--neck = "Republican platinum medal",
		neck = "Loricate Torque +1",
		body = EMPY.Body,
		hands = { name="Chironic Gloves", augments={'Pet: MND+4','Accuracy+3','"Refresh"+2',}},
		legs = "Chironic hose",
		feet = "Chironic slippers",
		waist = "Null Belt",
		--waist = "Fucho-no-obi",
		--left_ear = "Etiolation Earring",
		left_ear = "Eabani earring",
		right_ear = "Ethereal Earring",
		left_ring = "Stikini Ring +1",
		right_ring = "Stikini Ring +1",
		--back = RDMCape.TP
		back = RDMCape.STRWSD
	}

	sets.idle.Aminon =
		set_combine(
		sets.idle,
		{
			ammo = "Aurgelmir Orb +1",
			head = {name = "Bunzi's Hat", augments = {"Path: A"}},
			body = "Malignance tabard",
			hands = "Malignance Gloves",
			legs = "Malignance Tights",
			feet = "Malignance Boots",
			neck = "Rep. Plat. Medal",
			waist = "Goading Belt",
			left_ear = "Sherida Earring",
			right_ear = "Dedition Earring",
			left_ring = "Roller's Ring",
			right_ring = "Lehko's Ring",
			--back = RDMCape.TP
		}
	)

	sets.idle.Town = {
		main = "Crocea Mors",
		sub = "Ammurapi Shield",
		--head = "Null Masque",
		--hands = sets.Nyame.Hands,
		waist = "Orpheus's Sash"
	}

	sets.idle.PDT =
		set_combine(
		sets.idle,
		{
			head = "Nyame helm",
			hands = "Nyame gauntlets",
			body = "Nyame mail",
			legs = "Nyame flanchard",
			feet = "Nyame sollerets"
		}
	)

	sets.idle.MDT = set_combine(sets.idle.PDT)

	sets.idle.Weak = set_combine(sets.idle.PDT, {})

	sets.idle.DTHippo =
		set_combine(
		sets.idle.PDT,
		{
			back = "Umbra Cape",
			legs = "Carmine Cuisses +1",
			--feet = "Hippo. Socks +1"
		}
	)

	-- Defense sets
	sets.defense.PDT = {
		back = "Cheviot Cape",
		head = "Malignance chapeau",
		hands = "Nyame gauntlets",
		body = "Malignance tabard",
		waist = "Plat. Mog. Belt",
		legs = "Nyame flanchard",
		feet = "Nyame sollerets",
		left_ring = "Gelatinous Ring +1",
		right_ring = "Defending Ring"
	}

	sets.defense.NukeLock = sets.midcast["Elemental Magic"]

	sets.defense.MDT =
		set_combine(
		sets.defense.PDT,
		{
			ear1 = "Odnowa Earring +1"
		}
	)
	sets.defense.MEVA = set_combine(sets.defense.MDT, {})

	sets.Kiting = {legs = "Carmine Cuisses +1"}
	sets.latent_refresh = {waist = "Fucho-no-obi"}
	sets.latent_refresh_grip = {sub = "Oneiros Grip"}
	sets.TPEat = {neck = "Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Weapons sets
	sets.weapons.Dual1DMG = {main = "Qutrub knife", sub = "Chicken knife II", range = empty}
	sets.weapons.Chaos = {main = "Mpu Gandring", sub = "Machaera +2", range = empty}
	sets.weapons.Naegling = {main = "Naegling", sub = "Ammurapi Shield", range = empty}
	sets.weapons.DualWeapons = {main = "Naegling", sub = "Machaera +2", range = empty}
	sets.weapons.DualClubs = {main = "Maxentius", sub = "Machaera +2", range = empty}
	sets.weapons.DualAeolian = {main = "Tauret", sub = "Daybreak", range = empty}
	sets.weapons.Tauret = {main = "Tauret", sub = "Ammurapi Shield"}
	sets.weapons.Club = {main = "Maxentius", sub = "Ammurapi Shield"}
	sets.weapons.Enspell = {main = "Crocea Mors", sub = "Ammurapi Shield", range = empty}
	sets.weapons.EnspellDW = {main = "Crocea Mors", sub = "Demersal Degen +1", range = empty}
	sets.weapons.RedLotusBlade = {main = "Crocea Mors", sub = "Machaera +2", range = empty}
	sets.weapons.SeraphBlade = {main = "Crocea Mors", sub = "Daybreak", range = empty}
	sets.weapons.BowMacc = {main = "Naegling", sub = "Tauret", range = "Ullr", ammo = empty}
	sets.weapons.DualwBow = {main = "Naegling", sub = "Machaera +2", range = "Kaja Bow", ammo = "Chapuli arrow"}
	sets.weapons.ExDual ={main = "Excalibur", sub = "Machaera +2", range = empty}

	sets.buff.Sublimation = {waist = "Embla Sash"}
	sets.buff.DTSublimation = {waist = "Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		-- 	sub  Crepuscular Knife
		--  ranged  Empty
		--    legs  Malignance Tights
		--   waist  Windbuffet Belt +1
		--   ring1  Chirich Ring +1 A
		--   ring2  Chirich Ring +1 B
		--    back  Sucellos's Cape DEX Dual Wield
		--ammo = "Aurgelmir Orb +1",
		ammo = "Coiste Bodhar",
		range = empty,
		-- head = "Bunzi's Hat",
		head = "Malignance chapeau",
		hands = "Malignance Gloves",
		body = "Malignance tabard",
		left_ring = "Petrov Ring",
		--right_ring = "Petrov Ring",
		right_ring = "Defending ring",
		-- right_ring = "Lehko's Ring",
		legs = "Malignance tights",
		feet="Malignance Boots",
		neck = "Anu Torque",
		waist = "Sailfi Belt +1",
		--left_ear = "Sherida Earring",
		--right_ear = "Dedition Earring",
		left_ear = "Telos earring",
		right_ear = "Brutal Earring",
		back = "Null shawl"
		--back = RDMCape.TP
	}

	sets.engaged.Subtle =
		set_combine(
		sets.engaged,
		{
			left_ear = "Sherida Earring",
			left_ring = "Apate Ring"
		}
	)

	sets.engaged.Dual1DMG =
		set_combine(
		sets.engaged,
		{
			head = "Malignance chapeau",
			neck = "Sanctity necklace", 
			--ammo = "Sroda Tathlum",
			ear1 = "Suppanomimi",
			ear2 = "Eabani earring",
			body = EMPY.Body,
			hands = "Aya. Manopolas +2",
			ring1 = "Chirich ring +1",
			ring2 = "Defending Ring",
			waist = "Reiki yotai",
			back = "Sokolski mantle",
			legs = EMPY.Legs,
			feet = EMPY.Feet,
		}
	)

	sets.engaged.Enspell = set_combine(sets.engaged.EnspellOnly, {})

	sets.engaged.EnspellDW = set_combine(sets.engaged.EnspellOnly, {})

	sets.engaged.Acc =
		set_combine(
		sets.engaged,
		{
			neck = "Null Loop",
			waist = "Null Belt",
			right_ear = "Lethargy Earring"
		}
	)

	sets.engaged.FullAcc = set_combine(sets.Acc, {})

	sets.engaged.DT =
		set_combine(
		sets.engaged,
		{
			neck = "Loricate Torque +1"
		}
	)

	sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, sets.engaged.DT)

	sets.engaged.FullAcc.DT = set_combine(sets.engaged.FullAcc, sets.engaged.DT)

	sets.engaged.DW =
		set_combine(
		sets.engaged,
		{
			waist = "Reiki Yotai",
			ear2 = "Eabani Earring",
			-- ear2 = "Suppanomimi"
		}
	)
	sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {})
	sets.engaged.DW.FullAcc = set_combine(sets.engaged.DW, {})
	sets.engaged.DW.DT =
		set_combine(
		sets.engaged.DW,
		{
			ring1 = "Defending Ring"
		}
	)
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == "DNC" then
		set_macro_page(1, 1)
	elseif player.sub_job == "NIN" then
		set_macro_page(1, 1)
	elseif player.sub_job == "BLM" then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if
			state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and
				(buffactive["Elvorseal"] or buffactive["Reive Mark"] or not player.in_combat)
		 then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith("Addendum: ") or buff:endswith(" Arts") then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == "NIN" or player.sub_job == "DNC" then
		if player.equipment.main == nil or player.equipment.main == "empty" then
			windower.chat.input("/lockstyleset 010")
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input("/lockstyleset 010")
			else
				windower.chat.input("/lockstyleset 010") --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input("/lockstyleset 010")
			else
				windower.chat.input("/lockstyleset 010") --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input("/lockstyleset 010")
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input("/lockstyleset 010")
			else
				windower.chat.input("/lockstyleset 010") --Catchall
			end
		end
	elseif player.sub_job == "WHM" or state.Buff["Light Arts"] or state.Buff["Addendum: White"] then
		windower.chat.input("/lockstyleset 010")
	elseif player.sub_job == "BLM" or state.Buff["Dark Arts"] or state.Buff["Addendum: Black"] then
		windower.chat.input("/lockstyleset 010")
	else
		windower.chat.input("/lockstyleset 010")
	end
end

autows_list = {
	["Naegling"] = "Savage Blade",
	["DualWeapons"] = "Savage Blade",
	["DualWeaponsAcc"] = "Savage Blade",
	["DualEvisceration"] = "Evisceration",
	["DualClubs"] = "Black Halo",
	["DualAeolian"] = "Aeolian Edge",
	["EnspellDW"] = "Sanguine Blade",
	["Club"] = "Black Halo"
}
