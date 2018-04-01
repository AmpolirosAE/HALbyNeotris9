function OnMsg.ModsLoaded()
    if not DataInstances.Trait.Marked then
        local Marked = Trait:new()
        Marked.name = "Marked"
        Marked.display_name = "Marked"
        Marked.description = "Marked for recyclination by HAL. HAL regards this as positive and ensures us that it isn't like it sounds."
        Marked.category = "Positive"
        Marked.weight = 30
        Marked.rare = false
        Marked.auto = false
        Marked.show_in_traits_ui = true
        Marked.initial_filter = false
        Marked.incompatible = ""
		DataInstances.Trait.Marked = Marked
		Marked.hal_trait = true
		Marked.HAL_trait = true
	end
	Msg("DataLoaded")
end