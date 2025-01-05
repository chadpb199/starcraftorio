-- ambient-sounds

local menu_music = {
	{
		type = "ambient-sound",
		name = "sc-main-title",
		track_type = "menu-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-main-title.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-first-contact",
		track_type = "menu-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-first-contact.ogg"
	}
}

local terran_music = {
	{
		type = "ambient-sound",
		name = "sc-terran-one",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-terran-one.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-terran-two",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-terran-two.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-terran-three",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-terran-three.ogg"
	},
	
  {
    type = "ambient-sound",
    name = "sc-terran-ready",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-terran-ready.ogg"
  },
  {
    type = "ambient-sound",
    name = "sc-terran-victory",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-terran-victory.ogg"
  },
  {
    type = "ambient-sound",
    name = "sc-terran-defeat",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-terran-defeat.ogg"
  },
}

local protoss_music = {
	{
		type = "ambient-sound",
		name = "sc-protoss-one",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-protoss-one.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-protoss-two",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-protoss-two.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-protoss-three",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-protoss-three.ogg"
	},
	
  {
    type = "ambient-sound",
    name = "sc-protoss-ready",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-protoss-ready.ogg"
  },
  {
    type = "ambient-sound",
    name = "sc-protoss-defeat",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-protoss-defeat.ogg"
  },
}

local zerg_music = {
	{
		type = "ambient-sound",
		name = "sc-zerg-one",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-zerg-one.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-zerg-two",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-zerg-two.ogg"
	},
	{
		type = "ambient-sound",
		name = "sc-zerg-three",
		track_type = "main-track",
		planet = "nauvis",
		sound = "__starcraftorio__/sound/ambient/sc-zerg-three.ogg"
	},
	
  {
    type = "ambient-sound",
    name = "sc-zerg-ready",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-zerg-ready.ogg"
  },
  {
    type = "ambient-sound",
    name = "sc-zerg-victory",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-zerg-victory.ogg"
  },
  {
    type = "ambient-sound",
    name = "sc-zerg-defeat",
    track_type = "interlude",
    planet = "nauvis",
    sound = "__starcraftorio__/sound/ambient/sc-zerg-defeat.ogg"
  },
}

-- Choose which music to use, or all music.
if settings.startup["starcraftorio-all-species"].value then
	data:extend(terran_music, protoss_music, zerg_music)
elseif settings.startup["starcraftorio-pick-species"].value == "terran" then
	data:extend(terran_music)
elseif settings.startup["starcraftorio-pick-species"].value == "protoss" then
	data:extend(protoss_music)
elseif settings.startup["starcraftorio-pick-species"].value == "zerg" then
	data:extend(zerg_music)
end

data:extend(menu_music)


-- Replace some weapon sounds with Terran weapons

require("sound-util")

local sounds = {}

sounds.sc_terran_marine_gunshot = {
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/submachine-gunshot.bnvib",
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.4,
    duration = 30
  },
  variations = sound_variations("__starcraftorio__/sound/fight/sc-terran-marine-gunshot", 7, 0.6),
  priority = 64
}

sounds.sc_terran_rocket_launch = {
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/rocket-launcher.bnvib",
  },
  game_controller_vibration_data =
  {
    high_frequency_vibration_intensity = 0.4,
    duration = 30
  },
  variations = "__starcraftorio__/sound/fight/sc-terran-rocket-launch.ogg",
  priority = 64	
}

sounds.sc_tank_gunshot =
{
  switch_vibration_data =
  {
    filename = "__base__/sound/fight/tank-cannon.bnvib",
  },
  game_controller_vibration_data =
  {
    low_frequency_vibration_intensity = 0.9,
    duration = 200
  },
  filename = "__starcraftorio__/sound/fight/sc-tank-cannon.ogg",
  priority = 64
}

data.raw["gun"]["submachine-gun"].attack_parameters.sound = sounds.sc_terran_marine_gunshot
data.raw["gun"]["rocket-launcher"].attack_parameters.sound = sounds.sc_terran_rocket_launch
data.raw["gun"]["spidertron-rocket-launcher-1"].attack_parameters.sound = sounds.sc_terran_rocket_launch
data.raw["gun"]["spidertron-rocket-launcher-2"].attack_parameters.sound = sounds.sc_terran_rocket_launch
data.raw["gun"]["spidertron-rocket-launcher-3"].attack_parameters.sound = sounds.sc_terran_rocket_launch
data.raw["gun"]["spidertron-rocket-launcher-4"].attack_parameters.sound = sounds.sc_terran_rocket_launch
data.raw["gun"]["tank-cannon"].attack_parameters.sound = sounds.sc_tank_gunshot

-- Replace some biter/spitter sounds with Zerg sounds

-- Spitter attack sounds to Hydralisk attack sound
data.raw["unit"]["small-spitter"].attack_parameters.cyclic_sound.begin_sound.variations = nil
data.raw["unit"]["small-spitter"].attack_parameters.cyclic_sound.begin_sound.filename = "__starcraftorio__/sound/creatures/sc-spooghit.ogg"
data.raw["unit"]["small-spitter"].attack_parameters.cyclic_sound.begin_sound.aggregation.max_count = 1000

data.raw["unit"]["medium-spitter"].attack_parameters.cyclic_sound.begin_sound.variations = nil
data.raw["unit"]["medium-spitter"].attack_parameters.cyclic_sound.begin_sound.filename = "__starcraftorio__/sound/creatures/sc-spooghit.ogg"
data.raw["unit"]["medium-spitter"].attack_parameters.cyclic_sound.begin_sound.aggregation.max_count = 1000

data.raw["unit"]["big-spitter"].attack_parameters.cyclic_sound.begin_sound.variations = nil
data.raw["unit"]["big-spitter"].attack_parameters.cyclic_sound.begin_sound.filename = "__starcraftorio__/sound/creatures/sc-spooghit.ogg"
data.raw["unit"]["big-spitter"].attack_parameters.cyclic_sound.begin_sound.aggregation.max_count = 1000

data.raw["unit"]["behemoth-spitter"].attack_parameters.cyclic_sound.begin_sound.variations = nil
data.raw["unit"]["behemoth-spitter"].attack_parameters.cyclic_sound.begin_sound.filename = "__starcraftorio__/sound/creatures/sc-spooghit.ogg"
data.raw["unit"]["behemoth-spitter"].attack_parameters.cyclic_sound.begin_sound.aggregation.max_count = 1000

-- Define player death sounds for use in control.lua

data:extend({
	{
		type = "sound",
		name = "sc-terran-marine-death",
		variations = sound_variations("__starcraftorio__/sound/death/sc-terran-marine-death", 2)
	}
})