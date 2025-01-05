data:extend({
	{
		type = "bool-setting",
		name = "starcraftorio-replace",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "bool-setting",
		name = "starcraftorio-all-species",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "string-setting",
		name = "starcraftorio-pick-species",
		setting_type = "startup",
		default_value = "terran",
		allowed_values = {"terran", "zerg", "protoss"}
	}
})