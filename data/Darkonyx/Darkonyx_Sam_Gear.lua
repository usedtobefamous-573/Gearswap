-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal')
	state.Weapons:options('Masamune','ProcWeapon','Bow')

	gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !@^` gs c cycle Stance')
	send_command('bind !r gs c set skipprocweapons false;gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
	send_command('bind ^r gs c set skipprocweapons true;gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
	send_command('bind ^q gs c weapons Bow;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
     -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Myochin Kabuto",hands="Sakonji Kote"}
    sets.precast.JA['Warding Circle'] = {head="Myochin Kabuto"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main="Masamune",
    sub="Utu Grip",
    ammo="Oshasha's Treatise",
    head={ name="Valorous Mask", augments={'Accuracy+13','Weapon skill damage +5%','VIT+1','Attack+8',}},
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands="Kasuga Kote +3",
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Weapon skill damage +5%','Accuracy+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Flamma Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','STR+5','Weapon skill damage +10%',}},
}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Snow Gorget"})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})
    sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {waist="Snow Belt"})

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Thunder Gorget"})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {neck="Thunder Gorget"})
    sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {waist="Thunder Belt"})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Snow Belt"})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})


    -- Midcast Sets
    sets.midcast.FastRecast = {}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {feet="Danzo Sune-ate"}
    
    sets.idle.Field = {feet="Danzo Sune-ate"}

    sets.idle.Weak = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.defense.Reraise = {
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {
    main="Masamune",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Kasuga Kabuto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +2",
    legs="Kasuga Haidate +2",
    feet="Flam. Gambieras +2",
    neck={ name="Sam. Nodowa +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear={ name="Kasuga Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    left_ring="Defending Ring",
    right_ring="Petrov Ring",
    back={ name="Smertrios's Mantle", augments={'"Store TP"+10','Phys. dmg. taken-10%',}},
}
    sets.engaged.Acc = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Gorney Haubert +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.PDT = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Iximulew Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Acc.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
        
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
    sets.engaged.Adoulin = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Gorney Haubert +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Takaha Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Unkai Domaru +2",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.PDT = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Iximulew Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc.PDT = {ammo="Honed Tathlum",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}


    sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
    sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
end

	-- Weapons sets
	sets.weapons.Masamune = {main="Masamune",sub="Utu Grip"}
	sets.weapons.ProcWeapon = {main="Norifusa",sub="Bloodrain Strap"}
	sets.weapons.Bow = {main="Norifusa",sub="Utu Grip",range="Cibitshavore",ammo="Eminent Arrow"}
	
	-- Buff sets
	sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",legs="Flamma Dirs +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {hands="Wakido Kote +3"}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 1)
    else
        set_macro_page(1, 1)
    end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
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