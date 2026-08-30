-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'MIDAcc', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal','Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('MeleeDP','RNGDP','RNGArma')
	state.CompensatorMode:options('Always','300','1000','Never')

	gear.RAbullet = "Eminent Bullet"
	gear.WSbullet = "Eminent Bullet"
	gear.MAbullet = "Eminent Bullet"
	gear.QDBullet = "Eminent Bullet"
    --gear.RAbullet = "Chrono Bullet"
    --gear.WSbullet = "Chrono Bullet"
    --gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    --gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15
	
	--gear.tp_ranger_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}} -- needle racc to agi, and dt to pdt
    --gear.snapshot_jse_back = { name = "Camulus's Mantle", augments = { '"Snapshot"+10', } }
    gear.tp_jse_back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    --gear.ranger_wsd_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
    gear.magic_wsd_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.str_wsd_jse_back = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Phys. dmg. taken-10%',}}


	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @p gs c toggle AutoWSMode')

	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	send_command('bind ^q gs c weapons DualAeolian;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +2"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +2"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +2"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +2"}

    sets.precast.CorsairRoll = {
	main={ name="Rostam", augments={'Path: C',}},
    sub="Nusku Shield",
    range= "Compensator",
    head={ name="Lanun Tricorne +2", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Desultor Tassets", augments={'"Phantom Roll" ability delay -5','"Waltz" TP cost -5',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Regal Necklace",
    --waist="Flume Belt +1",
    --left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    --right_ear="Infused Earring",
    --left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back = gear.tp_jse_back,
	}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +3"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
    sets.precast.CorsairShot = {ammo= gear.EBbullet,
		head = "Malignance Chapeau",
        body = "Malignance Tabard",
        --hands = "Malignance Gloves",
        hands = "Ikenga's gloves",
		legs = "Chasseur's Culottes +2",
        feet = "Chasseur's Bottes +2",
        neck = "Iskur Gorget",
        --right_ear = "Dedition Earring",
        right_ear = "Chass ring +1",
		left_ear = "Telos Earring",
        --left_ring = "Crepuscular Ring",
        --right_ring = "Lehko's Ring",
		right_ring = "Ilabrat ring",
        left_ring = "Defending ring",
		waist = "Sailfi belt +1",
		--waist = "Goading Belt",
        --back = gear.ranger_wsd_jse_back,
		back = gear.magic_wsd_jse_back}
		
	sets.precast.CorsairShot.Damage = {
        --ammo = gear.QDbullet,
        ammo = gear.EBbullet,
		head = "Nyame helm",
        body = "Lanun Frac +3",
        hands = "Nyame gauntlets",
		--hands = { name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs = "Nyame Flanchard",
        feet = "Chasseur's Bottes +2",
        --neck = { name="Comm. Charm +2", augments={'Path: A',}},
        neck = "Sanctity necklace",
		waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Hecate's Earring",
		right_ring = "Ilabrat ring",
        left_ring = "Defending ring",
        --left_ring = "Acumen Ring",
        --right_ring = "Dingir Ring",
    }
		
	
    sets.precast.CorsairShot.Proc = {ammo= gear.EBbullet,
        head = "Malignance Chapeau",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        --neck = "Loricate Torque",
		ear1 = "Genmei Earring",
        ear2 = "Sanare Earring",
        body = "Malignance Tabard",
        --hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        --ring2 = "Dark Ring",
        ring2 = "Shadow ring",
		back = "Moonlight Cape",
        waist = "Carrier's Sash",
        legs = "Malignance Tights",
        feet = "Malignance Boots"}

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot.Damage, {}) 
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        --head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        --body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        --back="Moonbeam Cape",waist="Flume Belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet
		}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
	    --head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		body={ name="Herculean Vest", augments={'Blood Pact Dmg.+1','"Fast Cast"+5','Phalanx +1',}}, -- 9
		hands="Leyline Gloves",
		legs={ name="Taeon Tights", augments={'"Fast Cast"+5','Phalanx +3',}},  -- 6
		--feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, -- 8
		--neck="Voltsurge Torque", -- 4
		--waist="Witful Belt",
		left_ear="Loquac. Earring", -- 2
		--right_ear="Etiolation Earring", -- 1
		left_ring="Prolix Ring",
		--right_ring="Kishar Ring", -- 4
		--back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.EBbullet,
		head="Chass. Tricorne +3", -- 0/14
        body="Ikenga's Vest", -- 9/0
		--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		--legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		--feet="Meg. Jam. +2", -- 10/0
		feet = "Meghanada jambeaux",
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		--left_ring="Dingir Ring",
		--right_ring="Crepuscular Ring", -- 3/0
		--neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		--waist="Yemaya Belt", -- 0/5
		--back=gear.snapshot_jse_back, -- 10/0
		}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
	head="Chass. Tricorne +3",
    body="Laksa. Frac +3",
    --hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    --legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    --feet="Meg. Jam. +2",
    --neck={ name="Comm. Charm +2", augments={'Path: A',}},
    --waist="Yemaya Belt",
    --left_ring="Crepuscular Ring",
    --back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10','Phys. dmg. taken-10%',}},
	})
	
	
	--sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head="Chass. Tricorne +3",
    --body="Laksa. Frac +3",
    --hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    --legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    --feet="Meg. Jam. +2",
    --neck={ name="Comm. Charm +2", augments={'Path: A',}},
    --waist="Yemaya Belt",
    --left_ring="Crepuscular Ring",
    --back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10','Phys. dmg. taken-10%',}},})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		--neck = "Sanctity necklace",
		waist="Sailfi Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		right_ring= "Cornelia's ring",
		left_ring = "Rajas ring",
		--left_ring="Regal Ring",
        --right_ring="Epaminondas's Ring",
		back=gear.str_wsd_jse_back,
	}
		
    --sets.precast.WS.Acc = {head="Chass. Tricorne +3",
    --body="Chasseur's Frac +3",
    --hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    --legs="Chas. Culottes +3",
    --feet="Chass. Bottes +3",
    --neck="Combatant's Torque",
    --waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    --left_ear="Mache Earring +1",
    --right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Crit.hit rate+4',}},
    --left_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    --right_ring="Chirich Ring +1",
    --back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}	

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS.Proc = set_combine(sets.engaged, {})	
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Evisceration'] = {}
		
	sets.precast.WS['Evisceration'].Acc = {}

	sets.precast.WS['Savage Blade'] = {ammo = gear.EBbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	right_ring= "Cornelia's ring",
	left_ring = "Rajas ring",
    back= gear.str_wsd_jse_back,
	}

    sets.precast.WS['Savage Blade'].Acc = {head="Chass. Tricorne +3",
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs="Chas. Culottes +2",
    feet="Chass. Bottes +2",
    --neck="Combatant's Torque",
   -- waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    --left_ear="Odr Earring",
    --right_ear="Mache Earring +1",
    --left_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
    right_ring="Chirich Ring +1",
    --back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	
    sets.precast.WS['Last Stand'] = {
	ammo=gear.EBbullet,
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ikenga's Vest",
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = "Lanun Bottes +3",
    neck="Flame gorget",
    waist = "Flame Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    --ring2 = "Regal Ring",
	ring2= "Cornelia's ring",
    --right_ring="Dingir Ring",
    --back=gear.ranger_wsd_jse_back,
		back = gear.magic_wsd_jse_back
    }

    sets.precast.WS['Last Stand'].Acc = {}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {
		ammo=gear.EBbullet,
		head="Pixie Hairpin +1",
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		right_ring="Archon Ring",
		left_ring="Dingir Ring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        waist="Eschan Stone",
		back=gear.magic_wsd_jse_back,
	}
		
    sets.precast.WS['Leaden Salute'].Acc = {
	ammo=gear.EBbullet,
	head="Pixie Hairpin +1",
	feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	right_ring="Archon Ring",
	left_ring="Dingir Ring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    waist="Eschan Stone",
	back=gear.magic_wsd_jse_back,
	}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    --waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    --left_ring="Dingir Ring",
    right_ring="Cornelia's ring",
    back= gear.magic_wsd_jse_back
	}

    sets.precast.WS['Wildfire'] = {head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Dingir Ring",
    right_ring="Medada's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
    sets.precast.WS['Hot Shot'] = {
	ammo=gear.EBbullet,
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Flame gorget",
    waist = "Flame Belt",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring= "Cornelia's ring",
    back=gear.magic_wsd_jse_back
	}
    
	
	sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {left_ear="Ishvara Earring",
    right_ear={ name="Chas. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},}
	sets.AccMaxTP = {left_ear="Ishvara Earring",
    right_ear={ name="Chas. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 AGI+7',}},}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Devastating Bullet",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs="Chas. Culottes +3",
    feet="Chass. Bottes +3",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="K. Kachina Belt +1",
    left_ear="Mani Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Crit.hit rate+4',}},
    left_ring="Medada's Ring",
    right_ring="Weather. Ring +1",
    back={ name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {
		head="Ikenga's Hat",
		body="Ikenga's Vest",
        --hands="Malignance Gloves",
        hands = "Ikenga's gloves",
		--legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		legs= "Ikenga's trousers",
		feet="Ikenga's Clogs",
		neck="Iskur Gorget",
		--waist="Yemaya Belt",
		waist = "Reiki Yotai",
		--left_ear="Crep. Earring",
		--right_ear="Chas. Earring +1",
		right_ear = "Chasseur's earring +1",
		left_ring="Ilabrat Ring",
		--right_ring="Crepuscular Ring",
        --back=gear.tp_ranger_jse_back
	}

    sets.midcast.RA.MIDAcc = {
	ammo=gear.EBbullet,
    head="Meghanada Visor +2",
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Chasseur's Gants +3",
    legs={ name="Ikenga's Trousers", augments={'Path: A',}},
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Odr Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Crit.hit rate+4',}},
    left_ring="Dingir Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},}
	
	sets.midcast.RA.Acc = {
	head="Chass. Tricorne +3",
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs="Chasseur's Culottes +2",
    feet="Chass. Bottes +2",
    --neck="Null Loop",
   --waist="Null Belt",
    --left_ear="Crep. Earring",
    right_ear="Telos Earring",
    --left_ring="Crepuscular Ring",
    --right_ring={ name="Cacoethic Ring +1", augments={'Path: A',}},
   -- back="Null Shawl",
   }
	
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +3",}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Odnowa Earring +1",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	}
		
    sets.idle.PDT = {ammo="Devastating Bullet",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Odnowa Earring +1",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
		
    sets.idle.Refresh = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.EBbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {ammo=gear.EBbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA = {ammo=gear.EBbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}

	-- Weapons sets

	
	sets.weapons.MeleeDP = { main="Naegling",
    sub="Nusku Shield",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Living Bullet",}
	
	sets.weapons.RNGDP = {main={ name="Rostam", augments={'Path: A',}},
    sub={ name="Kustawi +1", augments={'Path: A',}},
    --range={ name="Death Penalty", augments={'Path: A',}},
	range= "Holliday",
    ammo="Eminent bullet",
	}
	
	sets.weapons.RNGArma = {main={ name="Rostam", augments={'Path: A',}},
    sub={ name="Kustawi +1", augments={'Path: A',}},
    range={ name="Armageddon", augments={'Path: A',}},
    ammo="Living Bullet",}
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Malignance Chapeau",
        neck = "Sanctity Necklace",
        ear1 = "Telos Earring",
        --ear2 = "Dedition Earring",
		ear2= "Brutal Earring",
        --body = "Adhemar Jacket +1",
        body="Malignance Tabard",
		--hands = "Adhemar Wrist. +1",
		hands = "Nyame gauntlets",
		--ring1="Lehko's Ring",
		ring1 = "Defending Ring",
        ring2 = "Epona's Ring",
        --waist = "Windbuffet Belt +1",
		waist = "Reiki yotai",
        legs="Chasseur's Culottes +2",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        back = gear.tp_jse_back,
	}
    
    sets.engaged.Acc = {}
		
    sets.engaged.DT = {head="Malignance Chapeau",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        --hands=sets.Malignance.Hands,
        legs="Chasseur's Culottes +2",
       -- feet = sets.Malignance.Feet,
        neck="Iskur Gorget",
        waist="Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear="Dedition Earring",
		ring1="Lehko's Ring",
        right_ring="Epona's Ring",
        back = gear.tp_jse_back,
	}
    
    sets.engaged.Acc.DT = {}

    sets.engaged.DW = {head="Malignance Chapeau",
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Ramuh Ring +1",
        back = gear.tp_jse_back,
        waist = "Olseni Belt",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
	}
    
    sets.engaged.DW = set_combine(sets.engaged, {
		ear2 = "Suppanomimi",
        waist = "Reiki Yotai",
    })
		
    sets.engaged.DW.DT = {head="Malignance Chapeau",
		head="Malignance Chapeau",
		body="Malignance Tabard",
        --hands=sets.Malignance.Hands,
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Chasseur's Culottes +2",
        --feet = sets.Malignance.Feet,
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck = "Iskur Gorget",
        ear1 = "Suppanomimi",
        ear2 = "Dedition Earring",
		--ring1 = "Lehko's Ring",
		ring1 = "Chirich ring +1",
        ring2 = "Epona's Ring",
        back = gear.tp_jse_back,
        waist = "Reiki Yotai",
	}
    
    --sets.engaged.DW.Acc.DT = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 11)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 19)
    elseif player.sub_job == 'RNG' then
        set_macro_page(9, 11)
    elseif player.sub_job == 'DRG' then
        set_macro_page(5, 11)
    else
        set_macro_page(1, 19)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 040')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 040')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
				windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 004')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	end
end

autows_list = {['Default']='Savage Blade',['Evisceration']='Evisceration',['Savage']='Savage Blade',['Ranged']='Last Stand',['DualWeapons']='Savage Blade',['DualSavageWeapons']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}