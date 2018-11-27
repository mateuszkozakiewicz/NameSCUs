local originalCreateUI = CreateUI 
local originalOnSelectionChanged = OnSelectionChanged
local UpdateAllUnits = import('/mods/NameSCUs/modules/allunits.lua').UpdateAllUnits
local NameUnits = import('/mods/NameSCUs/modules/nameunits.lua').NameUnits

function OnSelectionChanged(oldSelection, newSelection, added, removed)
   if not import('/mods/NameSCUs/modules/allunits.lua').IsAutoSelection() then
      originalOnSelectionChanged(oldSelection, newSelection, added, removed)
   end
end

function CreateUI(isReplay) 
  originalCreateUI(isReplay) 
  AddBeatFunction(UpdateAllUnits)
  if not isReplay then
	  ForkThread(NameUnits)
  end
end
