return {
PlaceObj('ModItemBuildingTemplate', {
	'name', "Citizen Recyclinator",
	'template_class', "CitizenRecyclinator",
	'pin_rollover_hint', T{750660251153, --[[ModItemBuildingTemplate Citizen Recyclinator pin_rollover_hint]] "<image UI/Infopanel/left_click.tga 1400> Select"},
	'pin_rollover_hint_xbox', T{299682916892, --[[ModItemBuildingTemplate Citizen Recyclinator pin_rollover_hint_xbox]] "<image UI/PS4/Cross.tga> View"},
	'construction_cost_Concrete', 25000,
	'construction_cost_Metals', 50000,
	'construction_cost_Polymers', 20000,
	'construction_cost_Electronics', 10000,
	'build_points', 30000,
	'is_tall', true,
	'dome_required', true,
	'maintenance_resource_type', "Polymers",
	'maintenance_resource_amount', 3000,
	'display_name', T{663131484516, --[[ModItemBuildingTemplate Citizen Recyclinator display_name]] "Citizen Recyclinator"},
	'display_name_pl', T{742937274564, --[[ModItemBuildingTemplate Citizen Recyclinator display_name_pl]] "Citizen Recyclinator"},
	'description', T{494286199476, --[[ModItemBuildingTemplate Citizen Recyclinator description]] "Recycles Citizens Over Time"},
	'build_category', "Dome Spires",
	'display_icon', "UI/Icons/Buildings/cloning_vats.tga",
	'build_pos', 4,
	'entity', "CloningVats",
	'encyclopedia_image', "UI/Encyclopedia/CloningVats.tga",
	'label1', "InsideBuildings",
	'palettes', "CloningVats",
	'demolish_sinking', range(15, 20),
	'demolish_tilt_angle', range(300, 720),
	'demolish_debris', 85,
	'electricity_consumption', 30000,
	'enabled_shift_3', true,
	'max_workers', 0,
	'specialist', "medic",
	'automation', 1,
	'auto_performance', 100,
	'resource_produced1', "PreciousMetals",
}),
PlaceObj('ModItemBuildingTemplate', {
	'name', "HAL",
	'template_class', "HAL",
	'pin_rollover_hint', T{910999291833, --[[ModItemBuildingTemplate HAL pin_rollover_hint]] "<image UI/Infopanel/left_click.tga 1400> Select"},
	'pin_rollover_hint_xbox', T{461332514217, --[[ModItemBuildingTemplate HAL pin_rollover_hint_xbox]] "<image UI/PS4/Cross.tga> View"},
	'construction_cost_Concrete', 25000,
	'construction_cost_Electronics', 10000,
	'build_points', 9000,
	'is_tall', true,
	'dome_required', true,
	'dome_spot', "Spire",
	'achievement', "FirstDomeSpire",
	'maintenance_resource_type', "PreciousMetals",
	'maintenance_resource_amount', 3000,
	'display_name', T{663131484516, --[[ModItemBuildingTemplate HAL display_name]] "HAL"},
	'display_name_pl', T{742937274564, --[[ModItemBuildingTemplate HAL display_name_pl]] "HAL"},
	'description', T{494286199476, --[[ModItemBuildingTemplate HAL description]] "The Institutes first attempt at an AI. Some bugs are to be expected."},
	'build_category', "Dome Spires",
	'display_icon', "UI/Icons/Buildings/sanatorium.tga",
	'build_pos', 7,
	'entity', "CloningVats",
	'encyclopedia_image', "UI/Encyclopedia/School.tga",
	'label1', "InsideBuildings",
	'palettes', "CloningVats",
	'demolish_sinking', range(5, 10),
	'demolish_tilt_angle', range(300, 600),
	'demolish_debris', 85,
	'enabled_shift_3', true,
	'gain_point', 10,
	'trait1', "Marked",
}),
PlaceObj('ModItemCode', {
	'name', "CitizenRecyclinator",
	'FileName', "Code/CitizenRecyclinator.lua",
}),
PlaceObj('ModItemCode', {
	'name', "HAL",
	'FileName', "Code/HAL.lua",
}),
PlaceObj('ModItemCode', {
	'name', "Marked",
	'FileName', "Code/Marked.lua",
}),
}
