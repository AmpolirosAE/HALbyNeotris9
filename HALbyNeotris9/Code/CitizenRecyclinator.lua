DefineClass.CitizenRecyclinator = {
__parents = {"ElectricityConsumer", "Workplace", "ResourceProducer"}
, progress = false
, resource_produced1 = "PreciousMetals", 
stockpile_spots1 = {"Resourcepile"}
}

CitizenRecyclinator.OnCalcProduction_RareMetals = function(producer, amount_to_produce)
  return MulDivRound((producer.parent).performance, amount_to_produce, 1000)
end

CitizenRecyclinator.Produce_RareMetals = function(producer, amount_produced)
  amount_produced = (SingleResourceProducer.Produce)(producer, amount_produced)
  do
    if producer.resource_produced == "PreciousMetals" then
      local CitizenRecyclinator = producer.parent
      Msg("CRP", CitizenRecyclinator, amount_produced)
    end
    return amount_produced
  end
end

CitizenRecyclinator.Init = function(self)
  self.progress = 0
end


CitizenRecyclinator.BuildingUpdate = function(self, dt, ...)
  if self.working then
    local points = MulDivRound(self.performance, g_Consts.Recycling_points, 100)
    self.progress = self.progress + points
    if self.progress >= 1000 then
		Msg("recycle")
	end
  end
  do
    self:UpdateUI()
  end
end

function OnMsg.recycle(recycle)
    for _, CitizenRecyclinators in ipairs (UICity.labels.CitizenRecyclinators) do
            for _, colonist in ipairs(CitizenRecyclinators.parent_dome.labels.Colonist or empty_table) do
                if colonist.traits.Adult then 
                    colonist:SetCommand("Die", "recycle") 
					; 
                    (self.parent_dome).Recycled_Colonists = (self.parent_dome).Recycled_Colonists + 1 
					;
                    Msg("CRP", CitizenRecyclinator, 1000)
                end 
            end
    end
end

CitizenRecyclinator.GetRecyclingProgress = function(self)
  return MulDivRound(self.progress, 100, 1000)
end


