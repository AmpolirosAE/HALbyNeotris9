DefineClass.HAL = {
__parents = {"ElectricityConsumer", "TrainingBuilding"}
, 
properties = {}
, training_type = "graduation", max_traits = 1}
for i = 1, HAL.max_traits do
  (table.insert)(HAL.properties, {template = true, id = "trait" .. i, name = T({725, "Learn trait <idx>"; idx = i}), default = false, name = "HAL", category = "HAL", editor = "combo", items = HALTraitsCombo})
end

HAL.CanTrain = function(self, unit, worker)
  if not (TrainingBuilding.CanTrain)(self, unit) then
    return false
  end
  local traits = {}
  for i = 1, self.max_traits do
    traits[#traits + 1] = self["trait" .. i]
  end
  local campatible = FilterCompatibleTraitsWith(traits, unit.traits)
  do return #campatible > 0 end
end


HAL.FireWorker = function(self, worker, shift, idx)
  self:OnTrainingCompleted(worker)
  self.life_time_trained = self.life_time_trained + 1
  ;
  (TrainingBuilding.FireWorker)(self, worker, shift, idx)
end


HAL.OnTrainingCompleted = function(self, unit)
  local chance = unit.training_points and (unit.training_points)[self.training_type] or 0
  local rand = self:Random(150)
  if rand <= chance then
    local traits = {}
    for i = 1, self.max_traits do
      traits[#traits + 1] = self["trait" .. i]
    end
    local compatible = FilterCompatibleTraitsWith(traits, unit.traits)
    if #compatible > 0 then
      unit:AddTrait((table.rand)(compatible))
    end
  end
  do
    if unit.training_points then
      (unit.training_points)[self.training_type] = nil
      if not next(unit.training_points) then
        unit.training_points = false
      end
    end
  end
end


HAL.SetTrait = function(self, idx, traitname, broadcast)
  if broadcast then
    BroadcastAction(self, "SetTrait", idx, traitname)
    return 
  end
  self["trait" .. idx] = traitname
  self:UpdateUI()
  ObjModified(self)
end

HAL.FillTraitSelectorItems = function(self, items, traits)
  local start = #items
  for i = 1, #traits do
    local trait = (DataInstances.Trait)[(traits[i]).value]
    do
      if IsTraitAvailable(trait, self.city) then
        local icon = "UI/Icons/Buildings/numbers_0" .. start + i .. ".tga"
        ;
        (table.insert)(items, {name = trait.name, icon = icon, display_name = trait.display_name, description = trait.description, action = function(dataset, delta, controller)

    local broadcast = (not controller or delta >= 0) and controller
    ;
    (dataset.object):SetTrait(dataset.idx, trait.name, broadcast)
  end
})
      end
    end
  end
end


HAL.GetInfopanelSelectorItems = function(self, dataset)
  local items = {}
  self:FillTraitSelectorItems(items, HALTraitsCombo(self))
  return items
end


