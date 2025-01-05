-- Play the Terran Marine death sound when a player dies.

require("sound-util")

script.on_event(defines.events.on_player_died, function(event)
	local player = game.get_player(event.player_index)
	player.surface.play_sound{
		path = "sc-terran-marine-death",
		position = player.position,
		volume_modifier = 1.0
	}
	end
)