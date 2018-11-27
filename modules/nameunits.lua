local GetAllUnits = import('/mods/NameSCUs/modules/allunits.lua').GetAllUnits
local name = ""

function NameUnits()
  while true do
	  WaitSeconds(1)
	  for _,u in GetAllUnits() do
		if u:IsInCategory("COMMAND") then 
			name = u:GetCustomName(nil) 
			if name == "a" then
				name = "SACU (RAS Presents): Tech 3 Support Armoured Command Unit"
				u:SetCustomName(name)
			end
		end
		if u:IsInCategory("BUILTBYQUANTUMGATE") then
			if name != nil and u:GetCustomName(nil) != name then
				u:SetCustomName(name)
			end
		end
	  end
  end
end
