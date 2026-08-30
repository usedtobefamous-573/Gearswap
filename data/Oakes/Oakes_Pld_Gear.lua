function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','TankMagic','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD', 'DT')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT_HP','PDT','PDT_Reraise')
    state.MagicalDefenseMode:options('MDT_HP','MDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA_HP','MEVA')
	state.IdleMode:options('Tank','MDT','Normal')
	state.Weapons:options('None','Aegis','Duban','TP','Aminon','NaeglingBlurred','Albion')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind ^q gs c set IdleMode Kiting')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons TP ;gs c update')
	send_command('bind !q gs c weapons None ;gs c update')
	
	send_command('bind ^@!insert input //sm all follow')
	send_command('bind ^@!home input //sm mirror')
	send_command('bind ^@!pageup input //send Darkonyx //sm start')
	send_command('bind ^@!pagedown input //send Mydriatictofu //sm start')
	send_command('bind ^@!end input //send Darkonyx //sm stop')
	send_command('bind ^@!delete input //send Mydriatictofu //sm stop')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
    gear.jse_fc_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    gear.jse_block_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}}
	gear.jse_cure_back = { name="Rudianos's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','"Cure" potency +10%','Spell interruption rate down-10%',}}
    gear.jse_enmity_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}}
    --gear.jse_str_back = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.jse_def_back = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}}

    sets.Enmity = {
		ammo="Staunch Tathlum +1",
        main="Burtgang",
		sub="Duban",
		head="Loess Barbuta +1",
		neck="Moonlight Necklace",
		ear1="Knightly Earring",
		ear2="Odnowa Earring +1",
		body="Chevalier's Cuirass +3",
		hands="Souveran Handschuhs +1",
		ring1="Murky Ring",ring2="Defending Ring",
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}},
		waist="Audumbla Sash",
		legs="Founder's Hose",
		feet="Souveran Schuhs +1",
        back=gear.jse_def_back
    }
            
    sets.Enmity.SIRD = {
        main="Burtgang",
        sub="Duban",
		ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",
		neck="Moonlight Necklace",
		ear1="Knightly Earring",
		ear2="Odnowa Earring +1",
		body="Chevalier's Cuirass +3",
		hands="Souveran Handschuhs +1",
		ring1="Murky Ring",
		ring2="Defending Ring",
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}},
		waist="Audumbla Sash",
		legs="Founder's Hose",
		feet="Souveran Schuhs +1",
        -- back=gear.jse_enmity_back,
        back=gear.jse_fc_back
    }
            
    sets.Enmity.DT = {
		ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",
		neck="Moonlight Necklace",
		ear1="Knightly Earring",
		ear2="Odnowa Earring +1",
		body="Chevalier's Cuirass +3",
		hands="Souveran Handschuhs +1",
		ring1="Murky Ring",
		ring2="Defending Ring",
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}},
		waist="Audumbla Sash",
		legs="Founder's Hose",
		feet="Souveran Schuhs +1",
        back=gear.jse_enmity_back
    }
            
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{
        legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{
        feet="Rev. Leggings +3",})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{
        feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{
        head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},}) 
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{
        body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{ 
        feet="Chev. Sabatons +3", })
    sets.precast.JA['Majesty'] = set_combine(sets.Enmity, {
    })
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {
        head="Rev. Coronet +3",
        body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},}
    ) 
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{
        feet="Rev. Leggings +3",
    })
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{
        sub = "Diamond Aspis",
        feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    })
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{
        sub = "Diamond Aspis",
        head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},
    })
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{
        sub = "Diamond Aspis",
        body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    })
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{
        sub = "Diamond Aspis",
        feet="Chev. Sabatons +3",
    })
    sets.precast.JA['Majesty'] = set_combine(sets.Enmity, {
    })
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {
        head="Rev. Coronet +3",
        body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    })
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        --neck={ name="Kgt. Beads +2", augments={'Path: A',}},
        neck="Airmid's gorget",
		waist="Luminary Sash",
        left_ear="Tuisto Earring",
        --right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
        right_ear= "Nourishing earring",
		left_ring="Murky ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.jse_cure_back,
    }
            
    sets.precast.JA['Chivalry'].DT = {
        ammo="Staunch Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Cab. Gauntlets +2", augments={'Enhances "Chivalry" effect',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Kgt. Beads +2", augments={'Path: A',}},
        waist="Luminary Sash",
        left_ear="Tuisto Earring",
        --right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
        right_ear= "Nourishing earring",
		left_ring="Murky ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back=gear.jse_cure_back,
    }
	
	sets.precast.JA['Provoke'] = {   
	   head={ name="Loess Barbuta +1", augments={'Path: A',}},
	   body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	   feet="Chevalier's sabatons +3",
	   neck="Moonlight Necklace",
	   waist="Creed Baudrier",
	   --left_ear="Trux Earring",
	   --right_ear="Cryptic Earring",
	   left_ring={ name="Apeile Ring +1", augments={'Path: A',}},
	   right_ring="Apeile Ring",   
	   back="Rudianos's Mantle",
}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})		
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +3"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    -- sets.precast.Waltz = {ammo="Aurgelmir Orb +1",
	-- 	head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
	-- 	body="Rev. Surcoat +4",hands="Regal Gauntlets",ring1="Asklepian Ring",ring2="Valseur's Ring",
	-- 	back="Moonlight Cape",waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    -- Don't need any special gear for Healing Waltz.
    -- sets.precast.Waltz['Healing Waltz'] = {}
    
    -- sets.precast.Step = {ammo="Aurgelmir Orb +1",
    --     head="Carmine Mask +1",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
    --     body="Flamma Korazin +2",hands="Regal Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
    --     back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}
		
	-- sets.precast.JA['Violent Flourish'] = {ammo="Aurgelmir Orb +1",
    --     head="Flam. Zucchetto +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
    --     body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
    --     back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="Rev. Surcoat +3",priority=1},
        hands="Leyline Gloves",
        -- hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Sakpata's Cuisses",
        feet="Chev. Sabatons +3",
        -- neck="Orunmila's Torque",
        neck="Voltsurge torque",
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear="Loquac. Earring",
        left_ring="Murky ring",
        right_ring="Kishar Ring",
        back=gear.jse_fc_back,
    }
		
    sets.precast.FC.DT = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="Rev. Surcoat +3",priority=1},
        hands="Leyline Gloves",
        -- hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Sakpata's Cuisses",
        feet="Chev. Sabatons +3",
        -- neck="Orunmila's Torque",
        neck="Voltsurge torque",
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear="Loquac. Earring",
        left_ring="Murky ring",
        right_ring="Kishar Ring",
        back=gear.jse_fc_back,
    }
            
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
		
    sets.precast.WS.DT = {}

    sets.precast.WS.Acc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar", -- Crepuscular Pebble
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Cornelia's Ring",
        right_ring="Regal ring",
        back=gear.jse_str_back,
    })

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
	
	sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS, {
        ammo="Coiste Bodhar", -- Crepuscular Pebble
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Thrud Earring",
        right_ear="Tuisto Earring", -- Chev. Earring +2
        left_ring="Cornelia's Ring",
        right_ring="Regal ring",
        back=gear.jse_str_back,
    })
    
    sets.precast.WS['Knights of Round'].Acc = set_combine(sets.precast.WS['Knights of Round'], {
        neck = "Null Loop",
        waist = "Null Belt",
        left_ring = "Regal Ring"
    })

	sets.precast.WS['Flat Blade'] = {}

    sets.precast.WS['Sanguine Blade'] = {}

    sets.precast.WS['Atonement'] = {
        ammo="Sapience Orb",
        head={ name="Loess Barbuta +1", augments={'Path: A',}},
        body="Chev. Cuisses +3",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet="Chev. Sabatons +3",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Tuisto Earring",
        right_ear="Cryptic Earring",
        left_ring="Apeile Ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_enmity_back,
    }

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="Rev. Surcoat +3",priority=1},
        hands = "Leyline Gloves",
        -- hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Sakpata's Cuisses",
        feet="Chev. Sabatons +3",
        neck="Voltsurge torque",
        -- neck="Orunmila's Torque",
        waist="Platinum moogle belt",
        left_ear="Tuisto Earring",
        right_ear="Loquac. Earring",
        left_ring="Murky ring",
        right_ring="Kishar Ring",
        back=gear.jse_fc_back,
    }
		
	sets.midcast.FastRecast.DT = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="Rev. Surcoat +3",priority=1},
        hands = "Leyline Gloves",
        -- hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Sakpata's Cuisses",
        feet="Chev. Sabatons +3",
        neck="Voltsurge torque",
        -- neck="Orunmila's Torque",
        waist="Platinum moogle belt",
        left_ear="Tuisto Earring",
        right_ear="Loquac. Earring",
        left_ring="Murky ring",
        right_ring="Kishar Ring",
        back=gear.jse_fc_back,
    }

    sets.midcast.Sleep = set_combine(sets.Enmity, {})
	sets.midcast.Sleep.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Dia = set_combine(sets.Enmity, {})
	sets.midcast.Diaga = set_combine(sets.Enmity, {})
    sets.midcast.Banish = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Banishga = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
        ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",
        body="Sakpata's Breastplate",
        -- body="Adamantite Armor",
        --hands="Regal Gauntlets",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        legs={ name="Cab. Breeches +2", augments={'Enhances "Invincible" effect',}},
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Chev. Earring +2",
        left_ring="Murky ring",
        right_ring="Apeile Ring +1",
        back=gear.jse_cure_back,
    }
            
    sets.midcast.Cure.SIRD = {
        ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",
        body="Chev. Cuirass +3",
        --hands="Regal Gauntlets",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
		legs= "Carmine Cuissses +1",
        --legs="Founder's Hose",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Plat. Mog. Belt",
		left_ear= "Knightly earring",
        --left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Chev. Earring +2",
        left_ring="Murky ring",
        right_ring="Apeile Ring +1",
        back=gear.jse_cure_back,
    }

    sets.midcast.Raise = sets.midcast.Cure.SIRD
            
    sets.midcast.Cure.DT = {
        ammo="Staunch Tathlum +1",
        head={ name="Loess Barbuta +1", augments={'Path: A',},priority=1},
        body={ name="Souv. Cuirass +1", augments={'VIT+12','Attack+25','"Refresh"+3',}},
        hands="Chev. Cuirass +3",
        legs="Sakpata's Cuisses",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Knightly Earring",
        right_ear="Nourish. Earring",
        left_ring= "Murky ring",
        right_ring = "Defending Ring",
        -- right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_cure_back,
    }
		
    sets.midcast.Reprisal = {
        sub="Priwen",
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Shab. Cuirass +1",
        hands="Regal Gauntlets",
        --legs="Founder's Hose",
		legs= "Carmine Cuissses +1",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear= "Knightly earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',},priority=1},
        left_ring= "Murky ring",
        right_ring = "Defending Ring",
        back=gear.jse_fc_back,
    }

	sets.Self_Healing = {
        ammo="Staunch Tathlum +1",
        head={ name="Loess Barbuta +1", augments={'Path: A',},priority=1},
        body={ name="Souv. Cuirass +1", augments={'VIT+12','Attack+25','"Refresh"+3',}},
        -- body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        --legs="Founder's Hose",
		legs= "Carmine Cuissses +1",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Platinum Moogle Belt",
        left_ear="Knightly Earring",
        right_ear="Nourish. Earring",
        left_ring= "Murky ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_fc_back,
    }
            
	sets.Self_Healing.SIRD = {
        ammo="Staunch Tathlum +1",
        head={ name="Loess Barbuta +1", augments={'Path: A',},priority=1},
        body={ name="Souv. Cuirass +1", augments={'VIT+12','Attack+25','"Refresh"+3',}},
        -- body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        legs="Founder's Hose",
		feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Knightly Earring",
        right_ear="Nourish. Earring",
        left_ring= "Murky ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_cure_back,
}
		
	sets.Self_Healing.DT = {
        ammo="Staunch Tathlum +1",
        head={ name="Loess Barbuta +1", augments={'Path: A',},priority=1},
        body={ name="Souv. Cuirass +1", augments={'VIT+12','Attack+25','"Refresh"+3',}},
        -- body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',},priority=1},
        legs="Founder's Hose",
		feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Creed Baudrier",
        left_ear="Knightly Earring",
        right_ear="Nourish. Earring",
        left_ring= "Murky ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_cure_back,
    }

	sets.Cure_Received = {}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Shab. Cuirass +1",
        --hands={ name="Regal Gauntlets",priority=1},
        legs="Founder's Hose",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Knightly Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',},priority=1},
        left_ring= "Murky ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back="Moonbeam cape",
    }
            
    sets.midcast['Enhancing Magic'].SIRD = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Shab. Cuirass +1",
        --hands={ name="Regal Gauntlets",priority=1},
        legs="Founder's Hose",
        feet="Odyssean Greaves",
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Knightly Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',},priority=1},
        left_ring= "Murky ring",
        right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
        back=gear.jse_fc_back,
    }

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        ear1 = "Earthcry Earring",
        legs = "Haven Hose",
        waist = "Siegel Sash"
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {sub="Srivatsa",ring2="Sheltered Ring"}) 
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		main="Sakpata's sword",
        sub="Priwen",
        ammo="Staunch Tathlum +1",
        --head={ name="Odyssean Helm", augments={'"Fast Cast"+5','VIT+14','Phalanx +4',}},
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
        body="Yorium Cuirass",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Sakpata's Cuisses",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Augmenting earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Weard Mantle"
    })
        
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {
		main="Sakpata's sword",
        sub="Priwen",
        ammo="Staunch Tathlum +1",
        --head={ name="Odyssean Helm", augments={'"Fast Cast"+5','VIT+14','Phalanx +4',}},
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
        body="Yorium Cuirass",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Founder's hose",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Augmenting earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Weard Mantle"
    })
	
    sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {
		main="Sakpata's sword",
        sub="Priwen",
        ammo="Staunch Tathlum +1",
        --head={ name="Odyssean Helm", augments={'"Fast Cast"+5','VIT+14','Phalanx +4',}},
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
        body="Yorium Cuirass",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Sakpata's Cuisses",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Augmenting earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Weard Mantle"
    })	
        
    sets.Phalanx_Received = {
		main="Sakpata's sword",
        sub="Priwen",
        ammo="Staunch Tathlum +1",
        --head={ name="Odyssean Helm", augments={'"Fast Cast"+5','VIT+14','Phalanx +4',}},
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
        body="Yorium Cuirass",
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="Sakpata's Cuisses",
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Audumbla Sash",
        left_ear="Augmenting earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Weard Mantle"
    }
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {}

    -- Idle sets
    sets.idle = {
        main ={ name="Burtgang",priority=1},
        sub="Duban",
        ammo="Staunch Tathlum +1",
		--head={ name="Odyssean Helm", augments={'Accuracy+2','Mag. Acc.+11','"Refresh"+1',}},
		head="Chevalier's Armet +3",
        body="Chev. Cuirass +3",
        hands="Chevalier's gauntlets +3",
        legs="Chevalier's cuisses +3",
        feet="Chev. Sabatons +3",
		neck="Warder's Charm +1",	
		waist="Platinum Moogle Belt",
        left_ear="Tuisto Earring",
        right_ear="Chevalier's earring +2",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Rudianos's Mantle",
    }
	
    sets.idle.MDT = {
		main ={ name="Burtgang",priority=1},
        sub="Aegis",
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Warder's Charm +1",
        waist="Creed Baudrier",
        --left_ear="Sanare Earring",
        left_ear="Ethereal earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',},priority=1},
        left_ring="Defending ring",
        right_ring="Murky ring",
        back=gear.jse_def_back,
    }

	sets.idle.Tank = {
		main ={ name="Burtgang",priority=1},
        sub={ name="Duban",priority=1},
        --ammo="Brigantia Pebble",
		ammo = "Staunch tathlum +1",
        head="Chevalier's Armet +3",
        body="Chevalier's Cuirass +3",
        -- body="Adamantite Armor",
        hands="Chevalier's Gauntlets +3",
        legs="Chevalier's cuisses +3",
        feet="Reverence Leggings +3",
        neck="Loricate Torque +1",
        waist="Platinum moogle belt",
        left_ear={ name="Tuisto Earring",priority=1},
        right_ear="Alabaster earring",
        left_ring="Murky ring",
        right_ring="Shadow ring",
        back=gear.jse_def_back,
    }  

    sets.idle.Town = {
	main="Burtgang",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs="Carmine Cuisses +1",
    feet="Chev. Sabatons +3",
    neck="Null Loop",
    waist="Orpheus's Sash",
    left_ear="Tuisto Earring",
    right_ear="Chevalier's earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }
		

	sets.Kiting = { legs = "Carmine Cuisses +1" }
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",}
	sets.passive.AbsorbMP = {waist="Flume Belt +1",}
    sets.MP_Knockback = {}
    sets.Twilight = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aminon	= {main="Excalibur",sub="Aegis",}
	sets.weapons.TP = {main="Excalibur",sub="Duban",}
	sets.weapons.Aegis = {main="Burtgang",sub="Aegis",}
	sets.weapons.Duban = {main="Burtgang",sub="Duban",}
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield +1",}
	sets.weapons.Albion = {main="Albion",sub="Pole Grip",}
    
    sets.defense.Block = {}
		
	sets.defense.PDT = {}
		
    sets.defense.PDT_HP = {}
		
	sets.defense.MDT = {}
		
    sets.defense.MDT_HP = {}

	sets.defense.MEVA = {}
		
    sets.defense.MEVA_HP = {}
		
    sets.defense.PDT_Reraise = set_combine(sets.defense.PDT_HP,{})
    sets.defense.MDT_Reraise = set_combine(sets.defense.MDT_HP,{})
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		main ={ name="Burtgang",priority=1},
        ammo="Coiste Bodhar",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Sanctity necklace",
		--neck="Combatant's Torque",
        waist="Sailfi Belt +1",
        left_ear="Telos Earring",
        right_ear="Chevalier's earring +2",
		--right_ear="Dedition Earring",
        --left_ring="Moonlight Ring",
		left_ring="Chirich ring +1",
        right_ring="Petrov Ring",
        back="Null Shawl",
    }
    
	sets.engaged.Tank = {
		main ={ name="Burtgang",priority=1},
        sub= {name="Duban",priority=1},
        ammo="Staunch Tathlum +1",
        head="Chev. Armet +3",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Chev. Cuisses +3",
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear={ name="Tuisto Earring",priority=1},
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Chirich ring +1",
        right_ring="Fortified Ring",
        back=gear.jse_cure_back,
    }
		
	sets.engaged.TankMagic = {
        sub="Aegis",
        --ammo="Brigantia Pebble",
		ammo = "Crepuscular pebble",
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',},priority=1},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Warder's Charm +1",
        -- neck={ name="Kgt. Beads +2", augments={'Path: A',},priority=1},
        waist="Null Belt",
        left_ear={ name="Tuisto Earring",priority=1},
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',},priority=1},
        left_ring="Defending Ring",
        right_ring={ name="Archon Ring",priority=1},
        back=gear.jse_block_back,
    }
            
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18) 
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 016')
end